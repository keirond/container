function(ctx) {
  // Kratos passes the session context as 'ctx'
  claims: {
    // The unique user ID
    sub: ctx.identity.id,

    // Standard claims - checking traits safely
    email: if std.objectHas(ctx.identity.traits, 'email') then ctx.identity.traits.email else null,
    preferred_username: if std.objectHas(ctx.identity.traits, 'username') then ctx.identity.traits.username else null,

    // Metadata and Session info
    session_id: ctx.id,
    aal: ctx.authenticator_assurance_level,

    // Identity schema
    schema_id: ctx.identity.schema_id,

    // Custom logic
    role: if std.objectHas(ctx.identity.traits, 'email') && std.endsWith(ctx.identity.traits.email, '@admin.cero.com') then 'admin' else 'user',
  }
}
