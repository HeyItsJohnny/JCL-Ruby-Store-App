class Item < ActiveRecord::Base
    has_many :lineitems
    
    before_destroy :make_sure_no_line_items
    
    validates :name, :description, :image, presence: true  
    validates :price, numericality: {greater_than_or_equal_to: 0.01}   
    validates :name, uniqueness: true  
    validates :image, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: 'must be GIF, JPG, PNG images'} 
    #SEARCH_TYPES = ["Description", "Name", "Price"]
    
    def make_sure_no_line_items
        if lineitems.empty? 
            returntrue
        else      
            errors.add(:base, 'Line Items present') 
            returnfalse
        end
    end
    
end
