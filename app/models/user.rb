class User < ApplicationRecord
  has_many(:user_deals)
  has_many(:preferences)
end
