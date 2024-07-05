import http from "k6/http";
import { check } from "k6";

export const options = {
  vus: 50,
  duration: "10s",
};

export default function () {
  const key =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9uZmFhZGRid2FqZmxwbW9ycG9wIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyMDAzMDY1MywiZXhwIjoyMDM1NjA2NjUzfQ.VurJKqZZFqEAN8Qda7lpiBIdIZWp6bx_tP815avS1zU";
  const res = http.get(
    `https://onfaaddbwajflpmorpop.supabase.co/rest/v1/purchases?select=*,profiles(*)&user_id=eq.366da9fd-47c4-4982-841f-a5a5575fbbf7`,
    {
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ` + key,
        apikey: key,
      },
    }
  );
  check(res, {
    "status is 200": (r) => r.status === 200,
  });
}
