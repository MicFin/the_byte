class CreateSearch < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.text :ingredlist
      t.text :allergy
      t.text :diet
      t.text :xingredlist
      t.text :course
      t.integer :max_time
    end
  end
end
