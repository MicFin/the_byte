class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :cookbook, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
