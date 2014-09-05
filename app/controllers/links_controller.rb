class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_url, notice: "New Link submitted! Congrats!"
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to link_path(@link), notice: "Link updated! Congrats!"
    else
      render 'edit'
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_url, notice: "Link removed."
  end

  private
  def link_params
    params.require(:link).permit(:name, :url, :description)
  end
end
