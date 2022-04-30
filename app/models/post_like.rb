# frozen_string_literal: true

class PostLike < ApplicationRecord
  self.table_name = 'likes'
  belongs_to :post
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_id }
end
