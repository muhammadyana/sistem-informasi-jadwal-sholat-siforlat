class AddAvatarToMosques < ActiveRecord::Migration[5.2]
  def change
    add_column :mosques, :avatar, :string
  end
end
