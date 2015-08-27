class CartsController < ApplicationController
  attr_reader :cart

  def show
    # @listing = Listing.find(params[:listing_id])
  end

  def create
    @listing = Listing.find(params[:listing_id])
    cart.add_listing(@listing.id)
    session[:cart] = cart.contents
    redirect_to cart_path
  end

  def destroy
    @listing = Listing.find(params[:listing_id])
    cart.remove_listing(@listing.id)
    session[:cart] = cart.contents
    flash[:remove] = "Successfully removed #{listing.name} from cart."
    redirect_to cart_path
  end
end
