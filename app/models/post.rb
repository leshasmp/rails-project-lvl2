# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :post_category
  belongs_to :user

  validates :title, :body, presence: true
  validates :body, length: { minimum: 50 }
end
