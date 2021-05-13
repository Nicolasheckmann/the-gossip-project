class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(gossip: @gossip, user: current_user)
    if @like.save
      flash[:notice] = 'Gossip liké'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:notice] = "Nous n'avons pas réussi à liker le Gossip pour la (ou les) raison(s) suivante(s) :"
      render 'new'
    end
  end
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = 'Gossip disliké'
    redirect_back(fallback_location: root_path)
  end
end