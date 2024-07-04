ALTER TABLE public.profiles
ADD COLUMN avatar_name UUID DEFAULT NULL REFERENCES storage.objects (id);

ALTER TABLE public.profiles
ADD COLUMN comment VARCHAR(140) DEFAULT NULL;

ALTER TABLE public.purchases
DROP COLUMN id;

ALTER TABLE public.purchases
ADD COLUMN id SERIAL PRIMARY KEY;