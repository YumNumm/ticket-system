import { SupabaseClient, User } from "@supabase/supabase-js";

export async function getUser(
  authorizationHeader: string,
  supabase: SupabaseClient,
): Promise<User | null> {
  const jwt = authorizationHeader.replace("Bearer ", "");
  const {
    data: { user },
  } = await supabase.auth.getUser(jwt);

  return user;
}
