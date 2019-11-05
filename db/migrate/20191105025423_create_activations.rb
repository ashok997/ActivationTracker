class CreateActivations < ActiveRecord::Migration[6.0]
  def change
    create_table :activations do |t|
      t.integer :phone_number
      t.integer :IMEI
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :carrier, null: false, foreign_key: true
      t.belongs_to :phone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
