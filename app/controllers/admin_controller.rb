class AdminController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize 
  # GET /welcome
  def index
      @total_orders = Order.count
  end

end
