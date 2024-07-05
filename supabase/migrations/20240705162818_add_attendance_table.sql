CREATE TYPE attendance_status AS ENUM ('PRESENT', 'LEAVE');

CREATE TABLE public.attendances (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v7(),
  user_id UUID NOT NULL REFERENCES auth.users ON DELETE CASCADE,
  status attendance_status NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.attendances ENABLE ROW LEVEL SECURITY;

CREATE INDEX ON public.attendances(user_id);
CREATE INDEX ON public.purchases(user_id);


CREATE TYPE public.role AS ENUM ('admin', 'user', 'sponsor', 'speaker');
ALTER TABLE public.profiles ADD COLUMN role role DEFAULT 'user' NOT NULL;

CREATE OR REPLACE FUNCTION public.role()
RETURNS role
STABLE
AS $$
  SELECT role
  FROM public.profiles
  WHERE id = auth.uid();
$$ LANGUAGE sql
SECURITY DEFINER
SET search_path TO 'public';



CREATE POLICY "Only admin can ALL on attendances" ON public.attendances
FOR ALL
USING (role() = 'admin');