class QuestionsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize    

  # GET /welcome
  def index

  end

end
