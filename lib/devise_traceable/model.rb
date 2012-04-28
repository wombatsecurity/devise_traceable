require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at
    # * ip_address
    
    module Traceable
      def stamp_out!
        "#{self.class}Tracing".constantize.create(:ip_address => self.current_sign_in_ip, :action => "Logout", "#{self.class}".foreign_key.to_sym => self.id)
      end

      def stamp_in!
        "#{self.class}Tracing".constantize.create(:ip_address => self.current_sign_in_ip, :action => "Login", "#{self.class}".foreign_key.to_sym => self.id)
      end   

      def stamp_password_changed!
        "#{self.class}Tracing".constantize.create(:ip_address => self.current_sign_in_ip, :action => "Password Changed", "#{self.class}".foreign_key.to_sym => self.id)
      end   
    end
  end
end
