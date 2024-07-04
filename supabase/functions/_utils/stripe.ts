// esm.sh is used to compile stripe-node to be compatible with ES modules.
import Stripe from "npm:stripe@16.1.0";

export const stripe = new Stripe(
  Deno.env.get("STRIPE_SECRET_KEY") ?? "",
  {
    httpClient: Stripe.createFetchHttpClient(),
    apiVersion: "2024-06-20",
  },
);
