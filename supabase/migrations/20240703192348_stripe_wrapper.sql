/*
create extension if not exists wrappers with schema extensions;

create foreign data wrapper stripe_wrapper
  handler stripe_fdw_handler
  validator stripe_fdw_validator;

-- Save your Stripe API key in Vault and retrieve the `key_id`
insert into vault.secrets (name, secret)
values (
  'stripe',
  'YOUR_SECRET'
)
returning key_id;

create server stripe_server
  foreign data wrapper stripe_wrapper
  options (
    api_key_id '309b26ea-ff6f-4cdc-8d98-7b6861db350b', -- The Key ID from above, required.
    api_url 'https://api.stripe.com/v1/',  -- Stripe API base URL, optional. Default is 'https://api.stripe.com/v1/'
    api_version '2024-06-20'  -- Stripe API version, optional. Default is your Stripe account’s default API version.
  );
  
create foreign table stripe.checkout_sessions (
  id text,
  customer text,
  payment_intent text,
  subscription text,
  attrs jsonb
)
  server stripe_server
  options (
    object 'checkout/sessions',
    rowid_column 'id'
  );

*/