require 'pry'
class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end
  def show
    @gossip = Gossip.find(params[:id].to_i)
  end
  def new
  end
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.where(email: "anonymous@anonymous.com").first)
    if @gossip.save
      redirect_to gossips_path(title: params[:title])
    else
      render 'new'
    end
  end
end
