class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def comfirm
    @order = Order.new(order_params)
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
