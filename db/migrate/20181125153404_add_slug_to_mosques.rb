class AddSlugToMosques < ActiveRecord::Migration[5.2]
  def change
    add_column :mosques, :slug, :string
    add_index :mosques, :slug, unique: true
  end
end
