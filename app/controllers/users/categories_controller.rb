class Users::CategoriesController < ApplicationController
  def index
    @category = Category.new
    # byebug
    if params[:genre_id] === nil
      @categories = current_user.categories.all
    else
      @categories = current_user.categories.where(genre_id: params[:genre_id])
    end
    @genres = Genre.all
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
    redirect_to admins_categories_path
  end

  def edit
    @category = Category.find(params[:id])
    @genres = Genre.all
  end

  def update
    @category = Category.find(params[:id])
    @category.user_id = current_user.id
    @category.update(category_params)
    redirect_to admins_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path
  end

  private
  def category_params
    params.require(:category).permit(
      :name,
      :genre_id,
      :budget,
      :memo,
      :user_id
    )
  end
end
