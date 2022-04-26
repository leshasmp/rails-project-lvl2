# frozen_string_literal: true

class PostCategory < ApplicationRecord
  self.table_name = 'categories'
  has_many :posts, dependent: :destroy
end
