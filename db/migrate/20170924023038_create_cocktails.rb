class CreateCocktails < ActiveRecord::Migration[5.1]
  def change
    create_table :cocktails do |t|
      t.string :title
      t.string :ingredients
      t.text :method

      t.timestamps
    end
  end
end
