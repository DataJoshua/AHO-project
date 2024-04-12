class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :exels, dependent: :destroy
  belongs_to :region, optional: true

  attr_accessor :admin_created

  validates :region, presence: true, unless: :admin_created
end
