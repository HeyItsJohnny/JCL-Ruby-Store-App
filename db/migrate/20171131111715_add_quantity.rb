class AddQuantity < ActiveRecord::Migration
  def change    
      add_column :lineitems, :quantity, :integer, default: 1
  end
end
