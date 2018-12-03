class AddNecessaryFieldsToMosques < ActiveRecord::Migration[5.2]
  def change
  	add_column :mosques, :city, :string
  	add_column :mosques, :zipcode, :string
  	add_column :mosques, :country, :string
  	add_column :mosques, :iqomah, :integer
  end
end
