local session = std.extVar('session');
local identity = session.identity;

{
  sub: identity.id,
}
