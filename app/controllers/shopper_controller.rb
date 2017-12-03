class ShopperController < ApplicationController
    include CurrentCart
    before_action :set_cart
    skip_before_action :authorize    
  
    def index   
        #@items = Item.order(:name)
        @items = if params[:term]
            Item.where('name LIKE ? OR description LIKE ?', "%#{params[:term]}%", "%#{params[:term]}%")
        else
            @items = Item.order(:name)
        end
    end  
end
