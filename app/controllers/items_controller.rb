class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.avatar.build
  end

  def show
    @item = Item.find params[:id]
    @review = Review.new
    @item_reviews = Review.where(item_id: @item.id)
  end
end
