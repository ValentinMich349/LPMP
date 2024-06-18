class StoresController < ApplicationController
    def map
      @stores = Store.all # Assurez-vous que vous avez un modèle Store avec des coordonnées (latitude, longitude)
    end
  end