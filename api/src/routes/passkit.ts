import { Hono } from "hono";
import { Bindings } from "../global";
import { Barcode, PKPass } from "passkit-generator";
import { Buffer } from "node:buffer";
import icon from "../../assets/icon.png";
import background from "../../assets/background.png";
import { createClient } from "@supabase/supabase-js";

export const ticket = new Hono<{ Bindings: Bindings }>();

ticket.get("/apple", async (c) => {
  const supabase = createClient(
    c.env.SUPABASE_URL,
    c.env.SUPABASE_KEY,
  );

  const ticketId = c.req.query("ticket_id");
  const userId = c.req.query("user_id");
  if (!ticketId || !userId) {
    throw new Error("Missing ticket_id or user_id");
  }

  const purchase = await supabase.from("purchases").select().eq(
    "user_id",
    userId,
  ).eq("session_id", ticketId).maybeSingle();

  if (purchase.error) {
    throw purchase.error;
  }
  if (!purchase.data) {
    return new Response("Unauthorized", { status: 401 });
  }

  const pass = await generatePassTicket({
    env: c.env,
    userId: userId,
    ticketId: purchase.data.id,
  });

  return new Response(pass.getAsBuffer(), {
    headers: {
      "Content-type": pass.mimeType,
      "Content-disposition": `attachment; filename=myPass.pkpass`,
      "Cache-Control":
        "no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
    },
  });
});

async function generatePassTicket({
  env,
  userId,
  ticketId,
}: {
  env: Bindings;
  userId: string;
  ticketId: Number;
}): Promise<PKPass> {
  const pass = new PKPass({
    "icon.png": Buffer.from(icon),
    // "footer.png": Buffer.from(footer),
    "background.png": Buffer.from(background),
    //"background@2x.png": Buffer.from(background2x),
  }, {
    signerCert: env.SIGNER_CERT,
    signerKey: env.SIGNER_KEY,
    wwdr: env.WWDR,
  }, {
    description: "Ticket 2024",
    serialNumber: userId,
    passTypeIdentifier: "pass.net.yumnumm.ticketSystem",
    teamIdentifier: "CPL7H8SHVM",
    organizationName: "Ticket System(YumNumm)",
    foregroundColor: "rgb(255,255,255)",
    labelColor: "rgb(255,255,255)",
    sharingProhibited: true,
    logoText: "Ticket System",
  });

  const barcode: Barcode = {
    message: userId,
    format: "PKBarcodeFormatQR",
    altText: `TICKET-${ticketId.toString().padStart(4, "0")}`,
  };
  pass.setBarcodes(...[barcode]);
  pass.type = "eventTicket";

  pass.headerFields.push(
    {
      key: "header1",
      label: "開催日",
      value: "1月1日",
      textAlignment: "PKTextAlignmentCenter",
    },
  );

  pass.primaryFields.push(
    {
      key: "IATA-source",
      value: `TICKET-${ticketId.toString().padStart(4, "0")}`,
      label: "チケット番号",
      textAlignment: "PKTextAlignmentLeft",
    },
  );

  pass.secondaryFields.push();

  pass.auxiliaryFields.push();

  pass.backFields.push(
    {
      key: "Ticket ID",
      label: "Ticket ID",
      value: `TICKET-${ticketId.toString().padStart(4, "0")}`,
      textAlignment: "PKTextAlignmentLeft",
    },
    {
      key: "User ID",
      label: "User ID",
      value: userId,
      textAlignment: "PKTextAlignmentLeft",
    },
  );
  return pass;
}
