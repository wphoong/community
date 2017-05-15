class SubcommunitiesController < ApplicationController

  def index
    @subcom = Subcommunity.all
  end

  def new
    @subcom = Subcommunity.new
  end

  def create
    @subcom = Subcommunity.create(subcom_params)
    redirect_to root_path
  end

  def subcom_params
    params.require(:subcommunity).permit(:title, :slogan)
  end

end
