class OrdersController < ApplicationController

  def index
    @lineitems = nil
    @order = Order.where(user_id: current_user.id).where(state: 'init').first
    if @order.present?
      @lineitems = @order.line_items
    end
  end

  def create
    order = Order.where(user_id: current_user.id).where(state: 'init').first
    if order.blank?
      order = Order.create(user_id: current_user.id)
      order.update(order_number: order.id+1000, state: 'init')
    end
    item_id = params[:item][:id]
    lineitem = LineItem.create(item_id: item_id, order_id: order.id)

    quantity = params[:quantity]
    item = Item.find(item_id)
    amount = item.price * quantity.to_i
    lineitem.update(quantity: quantity, amount: amount)

    redirect_to(orders_path)
  end

  def order_items
    order = Order.find(params[:order][:id])
    order.update(order_params)
    order.update(state: 'in_progress')
  end

  private
  def item_params
    params.require(:item).permit(:id)
  end

  def order_params
    params.require(:order).permit(:name, :contact, :country, :zipcode, :address1, :address2, :note)
  end
end
