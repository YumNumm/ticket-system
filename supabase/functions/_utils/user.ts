import { User } from "https://esm.sh/v135/@supabase/gotrue-js@2.57.0/dist/module/index.js";
import { supabaseAdmin } from "./supabase.ts";

export async function getUser(
  authorizationHeader: string,
): Promise<User | null> {
  const jwt = authorizationHeader.replace("Bearer ", "");
  const {
    data: { user },
  } = await supabaseAdmin.auth.getUser(jwt);

  return user;
}
