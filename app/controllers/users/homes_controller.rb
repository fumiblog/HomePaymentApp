class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    gon.genre_name = Genre.all.pluck(:name)
    # @genres.each do |genre|
    #   gon.genre_total = Genre.joins(categories: :details).where(id: genre.id).sum(:coin)
    # end
    gon.progress_coin = Category.sum(:budget) - Genre.joins(categories: :details).sum(:coin)
    if user_signed_in?
      if params[:genre_id] == nil 
        @categories = current_user.categories
        @details = current_user.details
      else
        @categories = current_user.categories.where(:genre_id => params[:genre_id])
        @genre = Genre.find(params[:genre_id])
        @details = current_user.details.where(:genre_id => params[:genre_id])
      end
    else
      genre_budget_sort = Category.group(:genre_id).sum(:budget).sort_by{|_, v| v}.reverse.to_h.keys
      @genres = Genre.where(id: genre_budget_sort).order_as_specified(id: genre_budget_sort).limit(3)
      @categories = Category.all.order(budget: "DESC").limit(6)
      @details = Detail.all.order(coin: "DESC").limit(10)
    end
    # byebug
  end
end
