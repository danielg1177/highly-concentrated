
class GanjasController < ApplicationController
  before_action :set_ganja, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: %i[edible flower]

  def index
    @ganjas = policy_scope(Ganja)
    @markers = @ganjas.geocoded.map do |ganja|
      {
        lat: ganja.latitude,
        lng: ganja.longitude
      }
    end
  end


  def show
  end

  def new
    @ganja = Ganja.new

    authorize @ganja

  end

  def flower
    @ganjas = Ganja.where(variety: "flower")
    authorize @ganjas
  end

  def edible
    @ganjas = Ganja.where(variety: "edible")
    authorize @ganjas
  end

  def create

    @ganja = Ganja.new(ganja_params.merge(user: current_user))
    authorize @ganja
    if @ganja.save
      flash[:notice] = "ganja created"
      redirect_to seller_options_path
    else
      render :new
    end
  end

  def edit
    authorize @ganja
  end

  def update
    @ganja.update(ganja_params)
    authorize @ganja
    redirect_to seller_options_path
  end

  private

  def ganja_params
    params.require(:ganja).permit(:name, :strain,
                                  :description, :unit_price,
                                  :variety, :pickup_local, :user_id, :photo)

  end

  def set_ganja
    @ganja = Ganja.find(params[:id])
  end
end
