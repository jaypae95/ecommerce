class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admission, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to(item_path(item))
  end

  def create
    @item = Item.create(item_params)
    redirect_to(item_path(@item))
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @item_reviews = Review.where(item_id: @item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to(items_path)
  end

  private
  def item_params
    params.require(:item).permit(:title, :body, :price, :category_id, :avatar)
  end

  def check_admission
    if !current_user.is_admin
      redirect_to items_path
    end
  end

end
