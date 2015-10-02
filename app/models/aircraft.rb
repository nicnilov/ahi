class Aircraft < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_slug, use: :slugged

  validates_uniqueness_of :name, :slug
  validates_presence_of :manufacturers

  after_validation :reset_slug_on_errors

  has_and_belongs_to_many :manufacturers
  has_and_belongs_to_many :variants, class_name: 'Aircraft', join_table: :variants, foreign_key: :aircraft_id, association_foreign_key: :variant_id
  has_and_belongs_to_many :priors, class_name: 'Aircraft', join_table: :variants, foreign_key: :variant_id, association_foreign_key: :aircraft_id
  # has_many :blocks # such as P-51D-5-NA, P-51D-10-NA, F-16C Block 30, F-16C Block 50

  # scope :progenitors, { }

  def progenitor?
    self.priors.empty?
  end

  def variant?
    self.priors.exists?
  end

  private

  def generate_slug
    [
      [self.manufacturers.map(&:name).sort, :name, :alias].flatten
    ]
  end

  def should_generate_new_friendly_id?
    (new_record? && self.slug.blank?) || !self.slug.present?
  end

  def reset_slug_on_errors
    self.slug = nil if self.errors.present?
  end
end