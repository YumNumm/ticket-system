INSERT INTO
  storage.buckets (id, name, public)
VALUES
  ('avatars', 'avatars', false);

CREATE POLICY "Allow upload for authenticated users" ON storage.objects FOR INSERT TO authenticated
WITH
  CHECK (bucket_id = 'avatars');

CREATE POLICY "Allow read for their own objects" ON storage.objects FOR
SELECT
  TO authenticated USING ((SELECT auth.uid())::text = owner_id);