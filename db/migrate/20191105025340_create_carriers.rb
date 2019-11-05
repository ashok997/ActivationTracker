class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.string :name
      t.integer :cost
      t.integer :rating

      t.timestamps
    end
  end
end
