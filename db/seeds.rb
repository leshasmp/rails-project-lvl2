# frozen_string_literal: true

require 'faker'

5.times do
  Category.create!(
    name: Faker::Movie.title
  )
end
