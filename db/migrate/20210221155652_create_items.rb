class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,              null: false
      t.references :user,             null: false, foreign_key: true
      t.text :description,            null: false
      t.text :states,                 null: false
      t.integer :shipping_fee_id,     null: false
      t.integer :region_id,           null: false
      t.integer :eta_id,              null: false
      t.integer :price,               null: false

      t.timestamps
    end
  end
end
