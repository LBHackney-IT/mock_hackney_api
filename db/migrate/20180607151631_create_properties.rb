class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :postcode
      t.string :propertyReference
      t.boolean :maintainable

      t.timestamps
    end
  end
end
