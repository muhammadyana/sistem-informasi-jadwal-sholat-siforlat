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

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :mobile_phone, :provider, :uid, :current_sign_in_at, :last_sign_in_at, :date_of_birth, :address

  has_one :mosque
end
