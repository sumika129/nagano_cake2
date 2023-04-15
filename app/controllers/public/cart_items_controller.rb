class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
    @total = 0
  end

  def update
    @cart_items = CartItem.find(params[:id])
    if @cart_items.update(cart_item_params)
      redirect_to public_cart_items_path
    else
      render:index
    end
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def destroy

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
