class Admins::DetailsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @details = Detail.all
  end
  
end
