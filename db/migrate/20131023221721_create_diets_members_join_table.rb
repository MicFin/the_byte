class CreateDietsMembersJoinTable < ActiveRecord::Migration
  def change
    create_table :diets_members, id: false do |t|
      t.integer :diet_id
      t.integer :member_id
    end

    add_index :diets_members, :member_id
    add_index :diets_members, :diet_id
    add_index :diets_members, [:member_id, :diet_id]
  end
end