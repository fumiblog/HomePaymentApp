class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  # before_action :current_user
  # def correct_user
  #   @admin = Admin.find(params[:id])
  #   unless @genre.user.id == current_user.id
      
    # end
  def index
    @genre = Genre.new
    @genres = Genre.all
    @category_payment = Category.pluck(:genre_id, :id)
    # byebug
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admins_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
