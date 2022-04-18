# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry
  belongs_to :post

  validates :content, :email, presence: true
end
