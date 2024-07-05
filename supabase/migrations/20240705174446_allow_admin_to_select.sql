CREATE POLICY "Only admin can SELECT on profiles" ON public.profiles
    FOR SELECT TO authenticated
        USING (ROLE () = 'admin');

CREATE POLICY "Only admin can SELECT on purchases" ON public.purchases
    FOR SELECT TO authenticated
        USING (ROLE () = 'admin');

