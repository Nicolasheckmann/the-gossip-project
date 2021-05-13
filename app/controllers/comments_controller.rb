class CommentsController < ApplicationController

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:comment][:content], gossip: @gossip, user: User.where(email: "anonymous@anonymous.com").first)
    if @comment.save
      flash[:success] = 'Nouveau Commentaire créé'
      redirect_to @gossip
    else
      flash.now[:error] = "Nous n'avons pas réussi à créer le Commentaire pour la (ou les) raison(s) suivante(s) :"
      render 'new'
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = 'Commentaire modifié'
      redirect_to @gossip
    else
      flash.now[:error] = "Nous n'avons pas réussi à modifier le Commentaire pour la (ou les) raison(s) suivante(s) :"
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Commentaire supprimé'
    redirect_to @gossip
  end

  private  

  def comment_params
    params.require(:comment).permit(:content, :gossip_id)
  end
end