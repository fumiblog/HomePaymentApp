class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    if user_signed_in?
      if params[:genre_id] == nil
        gon.genre_name = Genre.all.pluck(:name)
        budgets = Category.group(:genre_id).order(genre_id: :ASC).sum(:budget).values
        coins = Genre.joins(categories: :details).group(:id).order(id: :ASC).sum(:coin).values
        budgets.zip(coins).each do |bud,coi|
          gon.genre_budget = bud - coi
        end
        @categories = Category.all
        @user_budget = current_user.categories.sum(:budget)
        @user_coin = current_user.details.sum(:coin)
        @details = current_user.details.order(day: 'DESC')
      else
        @categories = current_user.categories.where(:genre_id => params[:genre_id])
        @genre = Genre.find(params[:genre_id])
        @details = current_user.details.order(day: 'DESC')
      end
    else
      gon.genre_name = Genre.all.pluck(:name)
      gon.genre_budget = Category.group(:genre_id).order(genre_id: :ASC).sum(:budget).values
      genre_budget_sort = Category.group(:genre_id).sum(:budget).sort_by{|_, v| v}.reverse.to_h.keys
      @genres = Genre.where(id: genre_budget_sort).order_as_specified(id: genre_budget_sort).limit(3)
      @categories = Category.all.order(budget: "DESC").limit(6)
      @details = Detail.all.order(coin: "DESC").limit(10)
    end
    # byebug
  end
end
