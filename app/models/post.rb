class Post < ApplicationRecord
  include Discard::Model

  has_rich_text :content

  belongs_to :user
  belongs_to :region
end
