class Users::HomesController < ApplicationController
  def index
    @genres = Genre.all
    @users = User.all
    @categories = Category.all
    @details = Detail.all
    # render json: @details
    # @details = Detail.group(:day).sum(:coin).map{ |key, value| { day: key, coin: value }}
    # byebug
  end
end
