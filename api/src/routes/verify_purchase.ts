import { createClient } from "@supabase/supabase-js";
import app from "..";
import { getUser } from "../utils/user";

app.post("/verify_purchase", async (c) => {
  const supabase = createClient(
    c.env.SUPABASE_URL,
    c.env.SUPABASE_KEY,
  );

  const authorizationHeader = c.req.header("authorization");
  const unauthorizedResponse = createResponse({
    success: false,
    reason: "Unauthorized",
  });

  if (!authorizationHeader) {
    return unauthorizedResponse;
  }
  const user = await getUser(authorizationHeader, supabase);
  if (!user) {
    return unauthorizedResponse;
  }
  console.log("User:", user);
  // 既に購入済みかどうかをチェック
  const existingPurchase = await supabase.from("purchases").select().eq(
    "user_id",
    user.id,
  );
  if (existingPurchase.error) {
    console.error(existingPurchase.error);
    return createResponse({
      success: false,
      reason: "Error fetching existing purchase",
    });
  }
  if (existingPurchase.data.length > 0) {
    return createResponse({
      success: false,
      reason: "Already purchased",
    });
  }

  const stripeSessionId = c.req.query("session_id");
  if (!stripeSessionId) {
    return createResponse({
      success: false,
      reason: "Missing session_id",
    });
  }

  // Stripeのセッションを取得
  const result = await supabase.schema("stripe").from("checkout_sessions")
    .select().eq(
      "id",
      stripeSessionId,
    );
  if (result.error) {
    console.error(result.error);
    return Response.json({
      status: 500,
      body: "Error fetching checkout session",
    });
  }
  if (result.data.length === 0) {
    return createResponse({
      success: false,
      reason: "Checkout session not found",
    });
  }
  if (result.data.length > 1) {
    return createResponse({
      success: false,
      reason: "Multiple checkout sessions found",
    });
  }
  const session = result.data[0];
  const insertResult = await supabase.from("purchases").insert({
    user_id: user.id,
    session_id: session.id,
  });
  if (insertResult.error) {
    console.error(insertResult.error);
    return createResponse({
      success: false,
      reason: "Error inserting purchase",
    });
  }

  return createResponse({
    success: true,
    body: "Purchase recorded",
  });
});

type OnPurchasedResponse = {
  success: true;
  body: "Purchase recorded";
} | {
  success: false;
  reason:
    | "Unauthorized"
    | "Missing session_id"
    | "Already purchased"
    | "Error fetching existing purchase"
    | "Checkout session not found"
    | "Multiple checkout sessions found"
    | "Error inserting purchase";
};

function createResponse(response: OnPurchasedResponse): Response {
  console.log(response);
  return Response.json(response, {
    status: response.success ? 200 : 400,
  });
}
