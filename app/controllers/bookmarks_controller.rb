class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # @non_sel_movies = !@list.movies.order(name: :asc)
    @non_sel_movies = Movie.where.not(id: @list.movies).order(title: :asc)
  end
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_bookmark)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private
  def strong_bookmark
    return params.require(:bookmark).permit(:comment, :movie_id)
  end
end
