class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :mobile_phone, :provider, :uid, :current_sign_in_at, :last_sign_in_at, :date_of_birth, :address

  has_one :mosque
end
