CREATE TABLE
  IF NOT EXISTS public.purchases (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v7 () NOT NULL,
    user_id UUID UNIQUE NOT NULL REFERENCES public.profiles (id),
    session_id TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now () NOT NULL
  );

CREATE INDEX IF NOT EXISTS purchases_user_id_idx ON public.purchases (user_id);

CREATE INDEX IF NOT EXISTS purchases_session_id_idx ON public.purchases (session_id);

ALTER TABLE public.purchases ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow individual user to access their purchase" ON public.purchases
FOR SELECT
USING (
  (select auth.uid()) = user_id
);