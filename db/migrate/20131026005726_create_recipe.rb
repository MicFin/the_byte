class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :image
      t.text :link
      t.integer :rating
      t.integer :time
    end
  end
end
