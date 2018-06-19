class AddDwellingInformationToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :floor, :integer
    add_column :properties, :toilets, :integer
    add_column :properties, :bathrooms, :integer
  end
end
