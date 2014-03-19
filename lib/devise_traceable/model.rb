require 'devise_traceable/hooks/traceable'
require 'oj'
module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    # * ip_address

    module Traceable
      def stamp_out!
        self.stamp_out!(nil, nil)
      end

      def stamp_out!(user_agent, remote_ip)
        begin
          ActivityStream.create(
            ip_address: self.current_sign_in_ip,
            action: "Logout",
            user_id: self.id,
            notes: Oj.dump({
              user_agent: user_agent.to_s,
              remote_ip: remote_ip.to_s
            })
          )
        rescue Exception => e
          puts "Exception: #{e.message}"
        end
      end

      def stamp_in!
        self.stamp_in!(nil, nil)
      end

      def stamp_in!(user_agent, remote_ip)
        begin
          ActivityStream.create(
            ip_address: self.current_sign_in_ip,
            action: "Login",
            user_id: self.id,
            notes: Oj.dump({
              user_agent: user_agent.to_s,
              remote_ip: remote_ip.to_s
            })
          )
        rescue Exception => e
          puts "Exception: #{e.message}"
        end
      end

      def stamp_password_changed!
        self.stamp_password_changed!(nil, nil)
      end

      def stamp_password_changed!(user_agent, remote_ip)
        begin
          ActivityStream.create(
            ip_address: self.current_sign_in_ip,
            action: "Password Changed",
            user_id: self.id,
            notes: Oj.dump({
              user_agent: user_agent.to_s,
              remote_ip: remote_ip.to_s
            })
          )
        rescue Exception => e
          puts "Exception: #{e.message}"
        end
      end
    end
  end
end
