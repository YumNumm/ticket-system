import { Database } from "./schema.ts";
// Import Supabase client
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.0.0";

// WARNING: The service role key has admin priviliges and should only be used in secure server environments!
export const supabaseAdmin = createClient<Database>(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
);

export const supabaseStripe = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  {
    db: {
      schema: "stripe",
    },
  },
);
