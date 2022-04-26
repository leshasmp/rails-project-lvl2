# frozen_string_literal: true

class PostComment < ApplicationRecord
  self.table_name = 'comments'
  has_ancestry
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
end
