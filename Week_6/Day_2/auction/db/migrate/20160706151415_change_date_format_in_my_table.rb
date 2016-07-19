class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :deadline, :datetime
  end
end
