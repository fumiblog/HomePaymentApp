class Users::DetailsController < ApplicationController
  def new
    @detail = Detail.new
    @category = Category.find(params[:category_id])
  end

  def create
    @detail = Detail.find(detail_params)
    @detail.save
    redirect_to root_path
  end

  private
  def detail_params
    params.require(:detail).permit(
      :day,
      :peyment_method,
      :category_id,
      :memo,
      :coin
    )
  end
end
