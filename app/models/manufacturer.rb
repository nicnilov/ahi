class Manufacturer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :partial_name, use: :slugged

  validates_uniqueness_of :name

  has_and_belongs_to_many :aircrafts

  # TODO: introduce dates with precision, see
  # https://github.com/Spokeo/date_time_precision
  # http://stackoverflow.com/a/90311/2116518
  # http://stackoverflow.com/a/28110120/2116518
end