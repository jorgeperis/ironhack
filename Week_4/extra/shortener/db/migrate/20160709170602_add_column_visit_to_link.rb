class AddColumnVisitToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :visit, :integer, :default => 0
  end
end
