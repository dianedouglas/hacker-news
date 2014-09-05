class CommentsController < ApplicationController
  def new
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      redirect_to link_path(@link), notice: "New comment submitted! Congrats!"
    else
      render 'new'
    end
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_path(@link), notice: "New comment destroyed! Way to go!"
  end

  def edit
    @comment = Comment.find(params[:id])
    render 'edit'
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to link_path(@comment.link), notice: "Comment updated! Congrats!"
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end
end
