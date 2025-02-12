class SessionsController < ApplicationController
    def google_auth
      auth_info = request.env['omniauth.auth']
      # You can now use the auth_info hash to get user info
      user = User.find_or_create_by(email: auth_info['info']['email']) do |user|
        user.name = auth_info['info']['name']
      end
      
      # Save the access token and other necessary details for API usage
      user.update(google_token: auth_info['credentials']['token'])
  
      session[:user_id] = user.id
      redirect_to root_path
    end
  end
  