# After each sign in, sign out.
# This is only triggered when the user is explicitly set (with set_user)
# and on authentication. Retrieving the user from session (:fetch) does
# not trigger it.

Warden::Manager.before_logout do |record, warden, opts|
  user_agent = ""
  remote_ip = ""
  if !warden.nil?
    if !warden.env.nil?
      request = Rack::Request.new(warden.env)
      user_agent = request.user_agent
      remote_ip = request.remote_ip
    end
  end
  record.stamp_out!(user_agent, remote_ip) if record.respond_to?(:stamp_out!)
end

Warden::Manager.after_authentication do |record, warden, opts|
  user_agent = ""
  remote_ip = ""
  if !warden.nil?
    if !warden.env.nil?
        request = Rack::Request.new(warden.env)
        user_agent = request.user_agent
        remote_ip = request.remote_ip
    end
  end

  record.stamp_in!(user_agent, remote_ip) if record.respond_to?(:stamp_in!)
end