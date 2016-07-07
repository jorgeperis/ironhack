class AddMinimunBidColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :minimun_bid, :integer
  end
end
