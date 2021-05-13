module ApplicationHelper

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Se connecter pour continuer"
      redirect_to new_session_path
    end
  end
end
