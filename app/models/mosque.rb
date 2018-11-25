class Mosque < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
end
