class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
  end

  def update

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
