class BookmarksController < ApplicationController
  #  before_action :set_bookmark, only: [:show]

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    list = List.find(params[:list_id])
    @bookmark.list = list
    if @bookmark.save
      redirect_to list_path(list), notice: "bookmark created."
    else
      render :new, status: :unprocessable_entity
    end
    raise
  end

private
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
