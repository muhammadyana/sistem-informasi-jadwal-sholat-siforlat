# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string
#  first_name             :string
#  last_name              :string
#  mobile_phone           :string
#  address                :string
#  date_of_birth          :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#  username               :string
#  slug                   :string
#

class User < ApplicationRecord
  include ActiveModel::Serialization
  extend FriendlyId
  mount_uploader :avatar, AvatarUploader
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable


  include DeviseTokenAuth::Concerns::User

  validates :uid, uniqueness: { scope: :provider }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 30 },format: { without: /\s/ }

  before_validation :init_uid
  has_one :mosque

  def full_name
    return username unless first_name.present?
    "#{first_name} #{last_name}"
  end

  def self.from_social_provider(provider, user_params)
    where(provider: provider, uid: user_params['id']).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.assign_attributes user_params.except('id')
    end
  end

  private

  def uses_email?
    provider == 'email' || email.present?
  end

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end

end
