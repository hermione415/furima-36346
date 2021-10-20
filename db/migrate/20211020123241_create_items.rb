class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :items_name
      t.text :items_information
      t.integer :category_id
      t.integer :items_status_id
      t.integer :shipping_cost_id
      t.integer :shipping_area_id
      t.integer :days_to_ship_id
      t.integer :price
      t.references :user

      t.timestamps
    end
  end
end
