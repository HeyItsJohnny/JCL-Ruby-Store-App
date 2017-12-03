class Cart < ActiveRecord::Base
    #has_many :lineitems
    has_many :lineitems, dependent: :destroy
    
    def add_item( item_id)     
        current_item = lineitems.find_by(item_id: item_id) 
        if current_item       
            current_item.quantity += 1 
        else      
            current_item = lineitems.build(item_id: item_id) 
        end    
        current_item 
    end
    
    def total_price    
        lineitems.to_a.sum {|item| item.total_price} 
    end
end
