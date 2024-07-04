import { Hono } from "hono";
import { cors } from "hono/cors";
import { Bindings } from "./global";
import { HTTPException } from "hono/http-exception";

export const app = new Hono<{ Bindings: Bindings }>();

app.use(
  "*",
  cors({
    origin: "*",
    allowMethods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    maxAge: 10,
  }),
);

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

app.onError((err, c) => {
  console.error(err.toString());
  console.error(err.stack);
  throw new HTTPException(500, {
    message: "Internal Server Error",
    cause: err.toString(),
  });
});

export default app;
