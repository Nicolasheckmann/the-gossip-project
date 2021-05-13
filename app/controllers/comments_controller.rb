class CommentsController < ApplicationController
  def new
  end
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], user: User.where(email: "anonymous@anonymous.com").first, gossip: @gossip )
    if @comment.save
      flash[:notice] = 'Nouveau Commentaire créé'
      redirect_to @gossip
    else
      flash.now[:notice] = "Le commentaire ne peut pas être vide"
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:comment][:content] )
      flash[:notice] = 'Commentaire modifié'
      redirect_to @gossip
    else
      flash.now[:notice] = "Nous n'avons pas réussi à modifier le Commentaire pour la (ou les) raison(s) suivante(s) :"
      render :edit
    end
  end
end