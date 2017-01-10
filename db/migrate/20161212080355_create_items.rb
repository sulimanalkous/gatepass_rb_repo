class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :gatepass_id
      t.string :name
      t.decimal :qty

      t.timestamps
    end
    add_index("items", "gatepass_id")
  end
end
