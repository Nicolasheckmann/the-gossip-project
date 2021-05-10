class UserController < ApplicationController
  def profil
    @user = User.find(params[:id].to_i)
  end
end
