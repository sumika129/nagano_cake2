class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.addresses
  end

  def comfirm
   @cart_items = CartItem.all
    @total = 0
    @postage = 800
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    if params[:order][:select_address] == "a"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "b"
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "c"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage)
  end
end
