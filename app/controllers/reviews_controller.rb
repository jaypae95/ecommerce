class ReviewsController < ApplicationController
  def create
    pp = params[:review]
    item = Item.find(pp[:item_id].to_i)
    review = Review.create(user_id: current_user.id, item_id: item.id, body: pp[:body])

    redirect_to(item_path(item))
  end

  def destroy
    review = Review.find(params[:id])
    item = review.item_id
    review.destroy

    redirect_to(item_path(item))
  end


end
