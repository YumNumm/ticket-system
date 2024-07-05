CREATE POLICY "Only admin can SELECT on profiles" ON public.profiles
FOR SELECT
TO authenticated
USING (role() = 'admin');

CREATE POLICY "Only admin can SELECT on purchases" ON public.purchases
FOR SELECT
TO authenticated
USING (role() = 'admin');
