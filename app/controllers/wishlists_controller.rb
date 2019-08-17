class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.where(user_id: current_user.id)
  end

  def create
    item = Item.find(params[:id])
    if current_user.wishlists.where(item_id: item.id).exists?
      redirect_to(items_path)
    else
      @wishlist = Wishlist.create(item_id: item.id)
      @wishlist.update(user_id: current_user.id)
      redirect_to(item_path(item))
    end
  end

  def destroy
    wishlist = Wishlist.find(params[:id])
    wishlist.destroy

    redirect_to(wishlists_path)
  end

end
