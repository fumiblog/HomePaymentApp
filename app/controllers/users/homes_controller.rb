class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    gon.genre_name = Genre.all.pluck(:name)
    # @genres.each do |genre|
    #   gon.genre_total = Genre.joins(categories: :details).where(id: genre.id).sum(:coin)
    # end
    if params[:genre_id] == nil
      @categories = Category.all
      # byebug
    else
      @categories = Category.where(:genre_id => params[:genre_id])
      @genre = Genre.find(params[:genre_id])
      # byebug
    end
    @details = Detail.all
    # byebug
  end
end
