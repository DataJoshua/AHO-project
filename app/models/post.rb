class Post < ApplicationRecord
  include SpreadsheetArchitect
  include Discard::Model
  extend Enumerize

  STATES = %i[draft under_review approved rejected].freeze

  has_rich_text :content

  enumerize :state, in: STATES, predicates: true, scope: :shallow
  validates :approved_at, presence: false, on: :create
  validates :state, presence: true

  belongs_to :user
  belongs_to :region
end
