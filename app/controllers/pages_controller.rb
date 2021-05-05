class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about_us
                                                   contact_us faq]
  def home
    @ganjas = policy_scope(Ganja)
    @markers = @ganjas.geocoded.map do |ganja|
      {
        lat: ganja.latitude,
        lng: ganja.longitude
      }
    end
  end

  def about_us
  end

  def contact_us
  end

  def faq
  end
end
