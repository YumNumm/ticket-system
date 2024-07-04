import { Hono } from "hono";
import { cors } from "hono/cors";
import { Bindings } from "./global";
import { HTTPException } from "hono/http-exception";
import { verify_purchase } from "./routes/verify_purchase";

const app = new Hono<{ Bindings: Bindings }>();

app.use(
  "*",
  cors({
    origin: ["*.ticket.yumnumm.dev", "ticket.yumnumm.dev", "localhost:62784"],
    allowMethods: ["GET", "POST", "OPTIONS"],
  }),
);

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

app.route("/verify_purchase", verify_purchase);

app.onError((err, c) => {
  console.error(err.toString());
  console.error(err.stack);
  throw new HTTPException(500, {
    message: "Internal Server Error",
    cause: err.toString(),
  });
});

export default app;
