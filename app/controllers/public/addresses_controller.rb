class Public::AddressesController < ApplicationController

  def create
     address = Address.new(address_params)
     address.customer_id = current_customer.id
     address.save
     redirect_to '/addresses'
  end

  def show
  end

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
