import { Hono } from "hono";
import { Bindings } from "../global";
import { Barcode, PKPass } from "passkit-generator";
import { Buffer } from "node:buffer";
import icon from "../../assets/icon.png";
import background from "../../assets/background.png";

export const sample = new Hono<{ Bindings: Bindings }>();

sample.get("/wallet", async (c) => {
  const pass = await generatePassTicket({
    env: c.env,
  });

  return new Response(pass.getAsBuffer(), {
    headers: {
      "Content-type": pass.mimeType,
      "Content-disposition": `attachment; filename=pass.pkpass`,
      "Cache-Control":
        "no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
    },
  });
});

async function generatePassTicket({
  env,
}: {
  env: Bindings;
}): Promise<PKPass> {
  const pass = new PKPass({
    "icon.png": Buffer.from(icon),
    "icon@2x.png": Buffer.from(icon),
    "logo.png": Buffer.from(icon),
    "logo@2x.png": Buffer.from(icon),
    "background.png": Buffer.from(background),
  }, {
    signerCert: env.SIGNER_CERT,
    signerKey: env.SIGNER_KEY,
    wwdr: env.WWDR,
  }, {
    description: "イトーヨーカドー ポイントカード",
    serialNumber: "SERIAL_NUMBER",
    associatedStoreIdentifiers: [490936137],
    appLaunchURL: "itoyokadoapp://",
    passTypeIdentifier: "pass.net.yumnumm.ticketSystem",
    teamIdentifier: "CPL7H8SHVM",
    organizationName: "イトーヨーカドー ポイントカード",
    foregroundColor: "rgb(255,255,255)",
    labelColor: "rgb(255,255,255)",
    backgroundColor: "rgb(10,10,50)",
    sharingProhibited: true,
    maxDistance: 100,
    logoText: "イトーヨーカドー ポイントカード",
  });

  const barcode: Barcode = {
    message: "123456789012345678",
    format: "PKBarcodeFormatCode128",
    altText: "123456789012345678",
  };
  pass.setBarcodes(...[barcode]);
  pass.type = "storeCard";

  pass.setLocations(...[{
    latitude: 35.4003409,
    longitude: 139.5740615,
  }]);

  pass.headerFields.push();

  pass.primaryFields.push();

  pass.secondaryFields.push();

  pass.auxiliaryFields.push();

  pass.backFields.push();
  return pass;
}
