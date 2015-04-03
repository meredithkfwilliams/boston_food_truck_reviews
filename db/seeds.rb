# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative '../spec/support/factory_girl.rb'

if Rails.env.development?
  FactoryGirl.create(:vendor)
  FactoryGirl.create(:review)
end

['African',
  'American',
  'Asian',
  'Barbecue',
  'Breakfast',
  'Burger',
  'Dessert',
  'French',
  'Fusion',
  'Hot Dog',
  'Indian',
  'Italian',
  'Latin',
  'Mediterranean',
  'Other',
  'Sandwich',
  'Seafood',
  'Southern',
  'Spanish',
   'Vegan',
  'Vegetarian' ].each {|cat| Category.create(category_name: cat) }
