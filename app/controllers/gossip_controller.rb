class GossipController < ApplicationController
  def content
    @gossip = Gossip.find(params[:id].to_i)
  end
end
