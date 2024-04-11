class Region < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :posts, dependent: :restrict_with_error
end
