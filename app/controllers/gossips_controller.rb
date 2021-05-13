class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @gossip.save
      flash[:notice] = 'Nouveau Gossip créé'
      redirect_to gossips_path
    else
      flash.now[:notice] = "Nous n'avons pas réussi à créer le nouveau Gossip pour la (ou les) raison(s) suivante(s) :"
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:id]) 
    unless @gossip.user != current_user
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip][:title], content: params[:gossip][:content] ) &&  @gossip.user == current_user
      flash[:notice] = 'Gossip modifié'
      redirect_to gossip_path(@gossip.id)
    else
      flash.now[:notice] = "Nous n'avons pas réussi à modifier le Gossip pour la (ou les) raison(s) suivante(s) :"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy unless @gossip.user != current_user
    flash[:notice] = 'Gossip détruit'
    redirect_to gossips_path
  end
end
