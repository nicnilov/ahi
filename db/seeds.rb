# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Manufacturer.create([
  {
    name: 'North American Aviation',
    partial_name: 'North American',
    founded_at: Date.new(1928),
    defunct_at: Date.new(1967)
  },
  {
    name: 'Lockheed Martin',
    partial_name: 'Lockheed',
    founded_at: Date.new(1928),
    defunct_at: Date.new(1967)
  },

])