class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
