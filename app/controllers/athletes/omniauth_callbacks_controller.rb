# frozen_string_literal: true

class Athletes::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
   def all
    athlete = Athlete.from_omniauth(request.env["omniauth.auth"])
    if athlete.persisted?
      session[:athlete_id] = athlete.id
      sign_in athlete, notice: "Signed in!"
      redirect_to root_path
    else
      # Devise allow us to save the attributes eventhough
      # we havent create the user account yet
      session["devise.athlete_attributes"] = athlete.attributes
      redirect_to root_path
    end
  end
  alias_method :facebook, :all
  alias_method :google_oauth2, :all

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  def failure
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
