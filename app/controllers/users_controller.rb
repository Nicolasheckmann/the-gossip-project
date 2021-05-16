class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @cities = City.all.map { |city| [city.name, city.id] }
  end

  def create
    @user = User.new(user_params)
    @cities = City.all.map { |city| [city.name, city.id] }
    if @user.save
      log_in(@user)
      if params[:remember_me] == "1"
        remember(user)
      end
      flash[:notice] = 'Bienvenue chez Gossip !'
      redirect_to '/'
    else
      flash.now[:error] = "Nous n'avons pas réussi à créer votre profil pour la (ou les) raison(s) suivante(s) :"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password, :password_confirmation)
  end
end
