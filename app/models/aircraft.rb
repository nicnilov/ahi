class Aircraft < ActiveRecord::Base
  has_and_belongs_to_many :variants, class_name: 'Aircraft', join_table: :variants, foreign_key: :aircraft_id, association_foreign_key: :variant_id
end