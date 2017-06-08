class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.subscriptions.create(subcommunity: current_subcom)
    redirect_to subcommunity_path(current_subcom)
  end

  def destroy
    @subs = Subscription.find(params[:id])
    @subscribed.destroy
    redirect_to subcommunity_path(current_subcom)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_subscription
  #   @subscription = Subscription.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def subscription_params
  #   params.require(:)
  # end

  def current_subcom
    @current_subcom ||= Subcommunity.find(params[:subcommunity_id])
  end

  def current_subscription
    @current_subs ||= Subscription.find(params[:id])
  end
end
