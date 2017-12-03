class CombineItemsInCart < ActiveRecord::Migration 
    def up
        Cart.all.each do |cart| 
            sums = cart.lineitems.group(:item_id).sum(:quantity)
            sums.each do | item_id, quantity| 
                if quantity > 1 
                    cart.lineitems.where(item_id: item_id).delete_all 
                    item = cart.lineitems.build(item_id: item_id) 
                    item.quantity = quantity           
                    item.save! 
                end 
            end 
        end 
    end 
end
