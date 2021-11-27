class Users::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @users = User.all
    @categories = Category.all
  end
end
