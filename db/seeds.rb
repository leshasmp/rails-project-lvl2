# frozen_string_literal: true

require 'faker'

5.times do
  PostCategory.create!(
    name: Faker::Movie.title
  )
end
