class CreateExcludedIngredients < ActiveRecord::Migration
  def change
    create_table :excluded_ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end