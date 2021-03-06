class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                foreign_key: true
      t.references :category,            foreign_key: true
      t.string :title,                   null: false
      t.text :explanation,               null: false
      t.integer :price,                  null: false
      t.integer :item_condition_id,      null: false
      t.integer :shipping_charges_id,    null: false
      t.integer :shipping_area_id,       null: false
      t.integer :days_until_shipping_id, null: false
      t.timestamps
    end
  end
end
