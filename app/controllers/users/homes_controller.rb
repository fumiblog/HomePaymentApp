class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    gon.genre_name = Genre.all.pluck(:name)
    gon.progress_coin = Category.sum(:budget) - Genre.joins(categories: :details).sum(:coin)
    if user_signed_in?
      @user_budget = current_user.categories.sum(:budget)
      @user_coin = current_user.details.sum(:coin)
      if params[:genre_id] == nil 
        @categories = current_user.categories
        @details = current_user.details.order(day: 'DESC')
      else
        @categories = current_user.categories.where(:genre_id => params[:genre_id])
        @genre = Genre.find(params[:genre_id])
        @details = current_user.details.order(day: 'DESC')
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
