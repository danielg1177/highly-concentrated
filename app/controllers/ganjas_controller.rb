class GanjasController < ApplicationController
  before_action :set_ganja, only: %i[show edit]
  skip_before_action :authenticate_user!, only: [:edible, :flower]

  def index
    @ganja = policy_scope(Ganja)
  end

  def show; end

  def new
    @ganja = Ganja.new
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
    @ganja = Ganja.new(ganja_params)
    if @ganja.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @ganja.update(ganja_params)
    redirect_to ganja_path(@ganja)
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
