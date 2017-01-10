class CreateGatepasses < ActiveRecord::Migration[5.0]
  def up
    create_table :gatepasses do |t|
      t.integer :user_id
      t.integer :gate_type_id
      t.integer :national_id
      t.integer :company_id
      t.integer :section_id
      t.date :from_date
      t.date :to_date
      t.string :reason
      t.string :person
      t.string :car_no
      t.string :car_type
      t.string :car_color, null: true
      t.string :ref_no, null: true
      t.string :note, null: true
      t.timestamps

    end
    add_index("gatepasses", "user_id")
    add_index("gatepasses", "gate_type_id")
    add_index("gatepasses", "national_id")
    add_index("gatepasses", "company_id")
    add_index("gatepasses", "section_id")
  end

  def down
    drop_table :gatepasses
  end
end
