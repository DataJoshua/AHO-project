class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :posts, dependent: :destroy
  belongs_to :region
end
