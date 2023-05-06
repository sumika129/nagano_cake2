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

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.status = 0
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail = OederDetail.new
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.item_id = cart_item.item.id
      @order_detail.making_status = 0
      @order_detail.save!
    end
    @cart_items.destroy_all
    redirect_to public_orders_complete_path
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :customer_id, :billing_amount, :postage)
  end
end
