class CreateRepairs < ActiveRecord::Migration[5.1]
  def change
    create_table :repairs do |t|
      t.string :repairRequestReference
      t.string :propertyReference
      t.string :problemDescription
      t.string :priority

      t.timestamps
    end
  end
end
