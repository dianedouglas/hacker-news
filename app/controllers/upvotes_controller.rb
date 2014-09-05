class UpvotesController < ApplicationController
  def update
    @link = Link.find(params[:id])
    @link.upvote
    redirect_to root_url
  end
end
