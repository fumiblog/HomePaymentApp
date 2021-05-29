class Users::DetailsController < ApplicationController
  before_action :authenticate_user!
  def new
    @detail = Detail.new
    @category = Category.find(params[:category_id])
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.user_id = current_user.id
    @detail.save!
    redirect_to root_path
  end

  def index
    if params[:category_id] == nil
      @details = current_user.details.order(day: 'DESC')
    else
      @details = current_user.details.where(:category_id => params[:category_id])
    end
  end

  def edit
    @detail = Detail.find(params[:id])
    @category = current_user.categories
  end

  def update
    @detail = Detail.find(params[:id])
    @detail.user_id = current_user.id
    @detail.update!(detail_params)
    redirect_to users_details_path
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    redirect_to root_path
  end

  private
  def detail_params
    params.require(:detail).permit(
      :day,
      :payment_method,
      :category_id,
      :memo,
      :coin,
      :user_id
    )
  end
end
