class SessionsController < ApplicationController
  def new
    puts params
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      if params[:remember_me] == "1"
        remember(user)
      end
      flash[:notice] = 'Connexion réussie !'
      redirect_to '/'
    else
      flash.now[:error] = 'Email ou mot de passe invalide'
      render 'new'
    end
  end

  def destroy
    log_out(current_user)
    flash[:success] = 'Déconnecté'
    redirect_to '/'
  end
end