class LandingController < ApplicationController
  def welcome_user
    @user = User.find(params[:id].to_i)
  end
end
