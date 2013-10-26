class CreateRecipe < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredient_list
      t.text :image
      t.text :link
      t.integer :rating
      t.integer :time
      t.text :note
    end
  end
end
