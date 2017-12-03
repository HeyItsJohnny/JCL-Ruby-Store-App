class RemoveQuantity < ActiveRecord::Migration
  def change    
      remove_column :lineitems, :quantity
  end
end
