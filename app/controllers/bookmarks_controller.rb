class BookmarksController < ApplicationController
  before_action :set_list

  def new
    @bookmark = @list.bookmarks.new
  end

  def create
    @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to root_path
    else
      puts @bookmark.errors.first

      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
