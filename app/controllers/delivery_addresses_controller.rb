class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery_address, only: [:edit, :update, :destroy]

  def index
    @delivery_addresses = current_user.delivery_addresses
  end

  def new
    @delivery_address = current_user.delivery_addresses.build
  end

  def create
    @delivery_address = current_user.delivery_addresses.build(delivery_address_params)
    if @delivery_address.save
      redirect_to delivery_addresses_path, notice: 'Adresse de livraison ajoutée avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @delivery_address.update(delivery_address_params)
      redirect_to delivery_addresses_path, notice: 'Adresse de livraison mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @delivery_address.destroy
    redirect_to delivery_addresses_path, notice: 'Adresse de livraison supprimée avec succès.'
  end

  private

  def set_delivery_address
    @delivery_address = current_user.delivery_addresses.find(params[:id])
  end

  def delivery_address_params
    params.require(:delivery_address).permit(:address_line1, :address_line2, :city, :state, :zip_code, :country)
  end
end