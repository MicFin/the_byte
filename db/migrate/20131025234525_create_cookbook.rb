class CreateCookbook < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
