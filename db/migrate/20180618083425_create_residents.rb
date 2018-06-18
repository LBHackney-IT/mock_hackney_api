class CreateResidents < ActiveRecord::Migration[5.1]
  def change
    create_table :residents do |t|
      t.references :dwelling
      t.string :residentReference
      t.string :name
      t.datetime :last_call

      t.timestamps
    end
  end
end
