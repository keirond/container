local session = std.extVar('session');

{
  claims: {
    schema_id: session.identity.schema_id,
    active: session.active,
    user_id: session.identity.id,
    user_state: session.identity.state,
  }
}
