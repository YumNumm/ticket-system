import { verify_purchase } from "./verify_purchase";
import { Hono } from "hono";
import { createClient } from "@supabase/supabase-js";
import { getUser } from "../utils/user";
import { Database } from "../utils/schema";

jest.mock("@supabase/supabase-js");
jest.mock("../utils/user");

const app = new Hono();
app.route("/verify_purchase", verify_purchase);

describe("verify_purchase route", () => {
  let supabaseClientMock: jest.Mocked<ReturnType<typeof createClient>>;
  let getUserMock: jest.MockedFunction<typeof getUser>;

  beforeEach(() => {
    supabaseClientMock = createClient() as jest.Mocked<ReturnType<typeof createClient>>;
    getUserMock = getUser as jest.MockedFunction<typeof getUser>;
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it("should return Unauthorized if authorization header is missing", async () => {
    const req = new Request("http://localhost/verify_purchase", { method: "POST" });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(400);
    expect(body).toEqual({ success: false, reason: "Unauthorized" });
  });

  it("should return Unauthorized if authorization header is invalid", async () => {
    getUserMock.mockResolvedValueOnce(null);

    const req = new Request("http://localhost/verify_purchase", {
      method: "POST",
      headers: { authorization: "Bearer invalid_token" },
    });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(400);
    expect(body).toEqual({ success: false, reason: "Unauthorized" });
  });

  it("should return Already purchased if purchase with same session_id exists", async () => {
    getUserMock.mockResolvedValueOnce({ id: "user_id" } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      select: jest.fn().mockReturnValueOnce({
        eq: jest.fn().mockReturnValueOnce({
          data: [{ session_id: "session_id" }],
          error: null,
        }),
      }),
    } as any);

    const req = new Request("http://localhost/verify_purchase?session_id=session_id", {
      method: "POST",
      headers: { authorization: "Bearer valid_token" },
    });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(200);
    expect(body).toEqual({ success: true, body: "Already purchased" });
  });

  it("should return Already purchased with different session_id if purchase with different session_id exists", async () => {
    getUserMock.mockResolvedValueOnce({ id: "user_id" } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      select: jest.fn().mockReturnValueOnce({
        eq: jest.fn().mockReturnValueOnce({
          data: [{ session_id: "different_session_id" }],
          error: null,
        }),
      }),
    } as any);

    const req = new Request("http://localhost/verify_purchase?session_id=session_id", {
      method: "POST",
      headers: { authorization: "Bearer valid_token" },
    });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(400);
    expect(body).toEqual({ success: false, reason: "Already purchased with different session_id" });
  });

  it("should return Missing session_id if session_id is not provided", async () => {
    getUserMock.mockResolvedValueOnce({ id: "user_id" } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      select: jest.fn().mockReturnValueOnce({
        eq: jest.fn().mockReturnValueOnce({
          data: [],
          error: null,
        }),
      }),
    } as any);

    const req = new Request("http://localhost/verify_purchase", {
      method: "POST",
      headers: { authorization: "Bearer valid_token" },
    });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(400);
    expect(body).toEqual({ success: false, reason: "Missing session_id" });
  });

  it("should return Purchase recorded if purchase is successfully recorded", async () => {
    getUserMock.mockResolvedValueOnce({ id: "user_id" } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      select: jest.fn().mockReturnValueOnce({
        eq: jest.fn().mockReturnValueOnce({
          data: [],
          error: null,
        }),
      }),
    } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      schema: jest.fn().mockReturnValueOnce({
        from: jest.fn().mockReturnValueOnce({
          select: jest.fn().mockReturnValueOnce({
            eq: jest.fn().mockReturnValueOnce({
              data: [{ id: "session_id" }],
              error: null,
            }),
          }),
        }),
      }),
    } as any);
    supabaseClientMock.from.mockReturnValueOnce({
      insert: jest.fn().mockReturnValueOnce({
        data: null,
        error: null,
      }),
    } as any);

    const req = new Request("http://localhost/verify_purchase?session_id=session_id", {
      method: "POST",
      headers: { authorization: "Bearer valid_token" },
    });
    const res = await app.request(req);
    const body = await res.json();

    expect(res.status).toBe(200);
    expect(body).toEqual({ success: true, body: "Purchase recorded" });
  });
});
