class AddMinimunBidColumnToBid < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :minimun_bid, :integer
  end
end
