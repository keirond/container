local session = std.extVar('session');
local identity = session.identity;

{
  // The unique user ID
  sub: identity.id,

  // Standard claims
  email: if std.objectHas(identity.traits, 'email') then identity.traits.email else null,
  preferred_username: if std.objectHas(identity.traits, 'username') then identity.traits.username else null,
  phone_number: if std.objectHas(identity.traits, 'phone_number') then identity.traits.phone_number else null,

  // Metadata and Session info
  session_id: session.id,
  aal: session.authenticator_assurance_level,

  // Identity schema
  schema_id: identity.schema_id,

  // Custom app-specific logic
  // Example: Grant 'admin' if the email belongs to your domain
  role: if std.endsWith(identity.traits.email, '@admin.cero.com') then 'admin' else 'user',
}
