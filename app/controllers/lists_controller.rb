class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
  end
  def new
    @list = List.new
  end
  def create
    @list = List.new(strong_list)
    if @list.save
      redirect_to :lists
    else
      render :new
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :lists
  end

  private
  def strong_list
    return params.require(:list).permit(:name)
  end
end
