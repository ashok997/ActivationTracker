class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.string :model
      t.string :manufacturer
      t.string :storage

      t.timestamps
    end
  end
end
