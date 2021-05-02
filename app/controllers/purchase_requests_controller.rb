class PurchaseRequestsController < ApplicationController
  before_action :set_ganja, only: %i[new create]
  before_action :set_purchase_request, only: [:accept]

  def index
    @purchase_request = policy_scope(PurchaseRequest)
  end

  def new
    @purchase_request = PurchaseRequest.new
  end

  def create
    @purchase_request = PurchaseRequest.new(purchase_request_params)
    @purchase_request.ganja = @ganja
    redirect_to ganja_path(@ganja)
  end

  def accept
    @purchase_request.status
    redirect_to
  end

  private

  def set_purchase_request
    @purchase_request = PurchaseRequest.find(params[:id])
  end

  def set_ganja
    @ganja = Ganja.find(params[:ganja_id])
  end

  def purchase_request_params
    params.require(:purchase_request).permit(:user_id, :ganja_id, :status, :pickup_time)
  end
end
