class GanjasController < ApplicationController
  before_action :set_ganja, only: %i[show edit]

  def index
    @ganja = policy_scope(Ganja)
  end

  def show; end

  def new
    @ganja = Ganja.new
  end

  def create
    @ganja = Ganja.new(ganja_params)
    if @ganja.save
      redirect_to ganja_path_id
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
                                  :variety, :pickup_local, :user_id)
  end

  def set_ganja
    @ganja = Ganja.find(params[:id])
  end
end
