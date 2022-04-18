# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  has_many :post_comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { minimum: 50 }
end
