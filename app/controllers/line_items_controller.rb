class LineItemsController < ApplicationController
  def destroy
    lineitem = LineItem.find(params[:id])
    lineitem.destroy

    redirect_to(orders_path)
  end
end
