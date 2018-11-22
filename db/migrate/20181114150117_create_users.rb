class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
      t.string :address
      t.date :date_of_birth

      t.timestamps
    end
  end
end
