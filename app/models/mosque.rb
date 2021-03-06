# == Schema Information
#
# Table name: mosques
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :text
#  latitude   :float
#  longitude  :float
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  city       :string
#  zipcode    :string
#  country    :string
#  iqomah     :integer
#

class Mosque < ApplicationRecord
	extend FriendlyId
	is_impressionable
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  accepts_nested_attributes_for :user

  validates :latitude, :longitude, :name, :country,  presence: true
  
end
