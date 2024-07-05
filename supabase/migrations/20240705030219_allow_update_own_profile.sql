CREATE POLICY "Allow update own profile" ON public.profiles
FOR UPDATE
USING (auth.uid() = id);
