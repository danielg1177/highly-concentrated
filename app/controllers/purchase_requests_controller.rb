class PurchaseRequestsController < ApplicationController
  before_action :set_ganja, only: %i[new create]

  before_action :set_purchase_request, only: [:accept, :decline]

  before_action :set_purchase_request, only: %i[accept decline]

  def index
    @purchase_requests = policy_scope(PurchaseRequest)
  end

  def seller_options
    @purchase_requests = policy_scope(PurchaseRequest)
    authorize @purchase_requests
    @ganjas = Ganja.where(user: current_user)
  end

  def dashboard
    @purchase_requests = policy_scope(PurchaseRequest)
    authorize @purchase_requests
  end

  def new
    @purchase_request = PurchaseRequest.new
    authorize @purchase_request
  end

  def create
    @purchase_request = PurchaseRequest.new(purchase_request_params)
    @purchase_request.ganja = @ganja
    purchase_request.status = 'pending'
    if @purchase_request.save
      redirect_to ganja_path(@ganja)

    authorize @purchase_request
    @purchase_request.ganja = @ganja
    @purchase_request.user = current_user
    @purchase_request.status = 'pending'
    if @purchase_request.save
      flash[:notice] = "request created"
      redirect_to dashboard_path
    else
      render :new
      end
    end
  end

  def accept
    authorize @purchase_request
    @purchase_request.status = 'accepted'
    @purchase_request.save
    flash[:notice] = "request accepted"
    redirect_to seller_options_path
  end

  def decline
    authorize @purchase_request
    @purchase_request.status = 'declined'
    @purchase_request.save
    flash[:notice] = "request declined"
    redirect_to seller_options_path
  end

  private

  def set_purchase_request
    @purchase_request = PurchaseRequest.find(params[:purchase_request_id])
  end

  def set_ganja
    @ganja = Ganja.find(params[:ganja_id])
  end

  def purchase_request_params
    params.require(:purchase_request).permit(:user_id, :ganja_id, :status, :pickup_time)
  end
end
