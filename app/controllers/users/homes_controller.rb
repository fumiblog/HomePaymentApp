class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    if params[:genre_id] == nil
      @categories = Category.all
      # byebug
    else
      @categories = Category.where(:genre_id => params[:genre_id])
      @genre = Genre.find(params[:genre_id])
      # byebug
    end
    @details = Detail.all
  end
end
