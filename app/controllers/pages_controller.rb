class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
   def home
     @ganjas = policy_scope(Ganja)
    @markers = @ganjas.geocoded.map do |ganja|
      {
        lat: ganja.latitude,
        lng: ganja.longitude
      }
    end
 end
end
