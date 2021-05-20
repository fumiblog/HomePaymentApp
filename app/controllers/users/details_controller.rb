class Users::DetailsController < ApplicationController
  def new
    @detail = Detail.new
    @category = Category.find(params[:category_id])
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.save!
    redirect_to root_path
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
      :coin
    )
  end
end
