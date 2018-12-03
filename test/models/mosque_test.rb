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

require 'test_helper'

class MosqueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
