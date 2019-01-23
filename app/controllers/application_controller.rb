class ApplicationController < ActionController::Base
	before_action :load_cart
	def load_cart
		@@users = User.all
		@cart = Cart.find(session[:cart_id]) if session[:cart_id].present?
	end

end
