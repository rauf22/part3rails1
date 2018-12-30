class CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
	end
	def pay
		@cart = Cart.find(params[:id])
		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here: https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_BslPnG2L9OI0qdPgY30TgFYS"

		# Token is created using Checkout or Elements!
		# Get the payment token ID submitted by the form:
		token = params[:stripeToken]

		charge = Stripe::Charge.create({
		    amount: (@cart.total_price * 100).to_i, # Amount in cent
		    currency: 'usd',
		    description: 'Payment for cart #{@cart.id}',
		    source: token,
		})
		@cart.update(status: "copleted")
		session.delete(:cart_id)
		redirect_to root_path, notice: "The chocolate is on it's way"

	end
end