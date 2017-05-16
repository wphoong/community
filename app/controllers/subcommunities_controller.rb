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

  def show
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_not_found if @subcom.blank? 
  end

  def edit
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_not_found if @subcom.blank?   
  end

  def update
    @subcom = Subcommunity.find_by_id(params[:id])
    @subcom.update_attributes(subcom_params)
    redirect_to subcommunities_path
  end

  def destroy
    @subcom = Subcommunity.find_by_id(params[:id])
    @subcom.destroy
    redirect_to root_path
  end

  private

  def subcom_params
    params.require(:subcommunity).permit(:title, :slogan)
  end

  # def post_params
  #   params.require(:post).permit(:title, :description)
  # end


end
