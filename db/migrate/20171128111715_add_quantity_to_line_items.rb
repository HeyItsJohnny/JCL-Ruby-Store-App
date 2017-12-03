class AddQuantityToLineItems < ActiveRecord::Migration
  def change    
      change_column :lineitems, :quantity, :integer, default: 1
  end
end
