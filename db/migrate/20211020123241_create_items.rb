class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :items_name,            null: false
      t.text :items_information,       null: false
      t.integer :category_id,          null: false
      t.integer :item_state_id,        null: false
      t.integer :shipcost_id,     null: false
      t.integer :shiparea_id,     null: false
      t.integer :daystoship_id,      null: false
      t.integer :price,                null: false
      t.references :user

      t.timestamps
    end
  end
end
