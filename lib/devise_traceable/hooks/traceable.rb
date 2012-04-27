# After each sign in, sign out.
# This is only triggered when the user is explicitly set (with set_user)
# and on authentication. Retrieving the user from session (:fetch) does
# not trigger it.

Warden::Manager.before_logout do |record, warden, opts|
  if record.respond_to?(:stamp_out!)
    record.stamp_out!
  end
end

Warden::Manager.after_authentication do |record, warden, opts|
  if record.respond_to?(:stamp_in!)
    record.stamp_in!
  end
end