class AddOrderToLineItems < ActiveRecord::Migration
  def change    
      add_column :lineitems, :order_id, :integer
  end
end
