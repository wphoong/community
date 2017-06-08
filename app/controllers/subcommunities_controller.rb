class SubcommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new edit update destroy]

  def index
    @subcom = Subcommunity.all
  end

  def new
    @subcom = Subcommunity.new
  end

  def create
    @subcom = current_user.subcommunities.create(subcom_params)
    if @subcom.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @subs = Subscription.find_by_id(params[:subscription_id])
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_not_found if @subcom.blank?
  end

  def edit
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_not_found if @subcom.blank?
    return render_forbidden if current_user != @subcom.user
  end

  def update
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_forbidden if @subcom.user != current_user
    @subcom.update_attributes(subcom_params)
    redirect_to subcommunities_path
  end

  def destroy
    @subcom = Subcommunity.find_by_id(params[:id])
    return render_forbidden if @subcom.user != current_user
    @subcom.destroy
    redirect_to root_path
  end

  private

  def subcom_params
    params.require(:subcommunity).permit(:title, :slogan)
  end
end
