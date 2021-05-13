class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:notice] = 'Connexion réussie !'
      redirect_to '/'
    else
      flash.now[:error] = 'Email ou mot de passe invalide'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Déconnecté'
    redirect_to '/'
  end
end