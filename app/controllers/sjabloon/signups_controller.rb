class Sjabloon::SignupsController < ApplicationController
  before_action :redirect, only: [:new], if: :user_signed_in?

  layout "devise"

  def new
    @signup = Sjabloon::SignupForm.new
  end

  def create
    @signup = Sjabloon::SignupForm.new(signup_params)

    if @signup.save!
      sign_in @signup.object

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def redirect
    redirect_to root_path, notice: "You are already logged in"
  end

  def signup_params
    params.permit(
      :email,
      :team_name,
      :name,
      :password,
      :invite_token,
      :subscribe_to_newsletter,
      :accepted_terms,
      :accepted_privacy,
    )
  end
end

