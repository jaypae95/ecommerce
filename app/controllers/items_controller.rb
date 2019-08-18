class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    redirect_to(item_path(@item.id))
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @item_reviews = Review.where(item_id: @item.id)
  end

  private
  def item_params
    params.require(:item).permit(:title, :body, :price, :category_id, :avatar)
  end
end
