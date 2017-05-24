class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  



  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new

    current_user.subscriptions.create(subcommunity: current_subcom)
    redirect_to subcommunity_path(current_subcom)
  end

  # # PATCH/PUT /subscriptions/1
  # # PATCH/PUT /subscriptions/1.json
  # def update
  #   respond_to do |format|
  #     if @subscription.update(subscription_params)
  #       format.html { redirect_to @subscription, notice: 'Subscription was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @subscription }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @subscription.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /subscriptions/1
  # # DELETE /subscriptions/1.json
  # def destroy
  #   @subscription.destroy
  #   respond_to do |format|
  #     format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
end