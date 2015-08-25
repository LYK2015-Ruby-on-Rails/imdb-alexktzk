class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    authenticate
  end

  def twitter
    authenticate
  end

  def authenticate
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
