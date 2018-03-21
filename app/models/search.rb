class Search < ApplicationRecord
  scope :history, ->(keyword) { where(keyword: keyword).pluck(:keyword, :created_at) }

  validates :keyword, presence: true
end
