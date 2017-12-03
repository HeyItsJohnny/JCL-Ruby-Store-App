class LineitemsController < ApplicationController

  include CurrentCart
  before_action :set_cart  
  before_action :set_lineitem, only:                  
                 [:show, :edit, :update, :destroy]
  skip_before_action :authorize    

  def index
      @lineitems = Lineitem.all
  end
    
  def create 
      item = Item.find(params[:item_id]) 
      @line_item = @cart.add_item(item.id)
      #@lineitem = @cart.lineitems.build(item: item)
      
      #@line_item = LineItem.new(line_item_params)     
      
      respond_to do |format| 
          if @line_item.save         
              format.html { redirect_to root_url,notice: 'Line item was successfully created.' }   
              format.js
              format.json { render :show, status: :created, location: @line_item } 
          else        
              format.html { render :new }         
              format.json { render json: @line_item.errors, status: :unprocessable_entity } 
          end 
      end 
  end   
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lineitems
      @lineitems = Lineitem.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def lineitem_params
      params.require(:lineitem).permit(:item_id, :cart_id, :quantity)
  end
end
