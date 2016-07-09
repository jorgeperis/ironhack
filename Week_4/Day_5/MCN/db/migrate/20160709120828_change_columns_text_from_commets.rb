class ChangeColumnsTextFromCommets < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :text, :text_comment
  end
end
