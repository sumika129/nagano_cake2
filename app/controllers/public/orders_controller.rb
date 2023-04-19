class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.address
  end

  def comfirm

  end

  def index
  end

  def show
  end
end
