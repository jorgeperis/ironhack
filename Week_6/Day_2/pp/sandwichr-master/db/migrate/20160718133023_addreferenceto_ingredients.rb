class AddreferencetoIngredients < ActiveRecord::Migration[5.0]
  def change
    change_table :sandwich_ingredients do |t|
      t.references :sandwich, index: true
      t.references :ingredient, index: true
    end

  end
end
