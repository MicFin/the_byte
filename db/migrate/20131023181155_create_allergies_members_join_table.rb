class CreateAllergiesMembersJoinTable < ActiveRecord::Migration
  def change
    create_table :allergies_members, id: false do |t|
      t.integer :allergy_id
      t.integer :member_id
    end

    add_index :allergies_members, :member_id
    add_index :allergies_members, :allergy_id
    add_index :allergies_members, [:member_id, :allergy_id]
  end
end
