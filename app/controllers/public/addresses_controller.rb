class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to public_addresses_path
    else
      render:index
    end  
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end  
end
