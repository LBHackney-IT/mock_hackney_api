class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :target, polymorphic: true
      t.string :user
      t.text :text

      t.timestamps
    end
  end
end
