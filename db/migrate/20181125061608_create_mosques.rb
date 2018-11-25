class CreateMosques < ActiveRecord::Migration[5.2]
  def change
    create_table :mosques do |t|
      t.string :name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
