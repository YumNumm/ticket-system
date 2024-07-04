import "https://esm.sh/@supabase/functions-js/src/edge-runtime.d.ts";
import { getUser } from "../_utils/user.ts";
import { supabaseAdmin, supabaseStripe } from "../_utils/supabase.ts";

Deno.serve(async (req) => {
  const authorizationHeader = req.headers.get("authorization");
  const unauthorizedResponse = createResponse({
    success: false,
    reason: "Unauthorized",
  });

  if (!authorizationHeader) {
    return unauthorizedResponse;
  }
  const user = await getUser(authorizationHeader);
  if (!user) {
    return unauthorizedResponse;
  }
  const requestedUri = new URL(req.url);
  const stripeSessionId = requestedUri.searchParams.get("session_id");
  if (!stripeSessionId) {
    return createResponse({
      success: false,
      reason: "Missing session_id",
    });
  }

  // Stripeのセッションを取得
  const result = await supabaseStripe.from("checkout_sessions").select().eq(
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
  const insertResult = await supabaseAdmin.from("purchases").insert({
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
    | "Checkout session not found"
    | "Multiple checkout sessions found"
    | "Error inserting purchase";
};

function createResponse(response: OnPurchasedResponse): Response {
  return Response.json(response, {
    status: response.success ? 200 : 400,
  });
}
