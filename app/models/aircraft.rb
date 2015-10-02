class Aircraft < ActiveRecord::Base
  extend FriendlyId
  friendly_id :generate_slug, use: :slugged

  validates_presence_of :manufacturers, :variant_type
  validates_presence_of :priors, if: Proc.new { |aircraft| aircraft.block? }

  validates_uniqueness_of :name, scope: :variant_type
  validates_uniqueness_of :slug

  after_validation :reset_slug_on_errors

  has_and_belongs_to_many :manufacturers
  has_and_belongs_to_many :variants, class_name: 'Aircraft', join_table: :variants, foreign_key: :aircraft_id, association_foreign_key: :variant_id
  has_and_belongs_to_many :priors, class_name: 'Aircraft', join_table: :variants, foreign_key: :variant_id, association_foreign_key: :aircraft_id

  # Family is a group of aircraft developed from the same base model like Boeing 747, P-51, F-16
  scope :families, -> { where(variant_type: :family) }

  # Mofifications are upgrades or developments of an aircraft, such as P-51A, P-51B
  # A modification may inherit from multiple parents, that is have many priors, but a modifications graph
  # within a particular family must eventually converge to a single root, which is the family itself
  # Modification name may collide with family name as is the case with P-51, see generate_slug for handling
  # Name collisions between modifications or blocks are not expected
  scope :modifications, -> (aircraft) { aircraft.variants.where(variant_type: :modification) }

  # Blocks are production series of a specific modification as P-51D-5-NA, P-51D-10-NA, F-16C Block 30, F-16C Block 50
  # Blocks are not expected to refer to more than one modification
  # Blocks are not expected to refer directly to families
  scope :blocks, -> (aircraft) { aircraft.variants.where(variant_type: :block) }

  def variant?
    self.priors.exists? # TODO: make sure variant_type is always filled out
  end

  def block?
    self.variant_type == 'block'
  end

  private

  def generate_slug
    if self.block?
      [
        [self.manufacturers.map(&:name).sort, self.priors.first.name, :name, :alias].flatten
      ]
    else
      [
        [self.manufacturers.map(&:name).sort, :name, :alias].flatten,
        [self.manufacturers.map(&:name).sort, :name, :alias, 'variant'].flatten
      ]
    end
  end

  def should_generate_new_friendly_id?
    (new_record? && self.slug.blank?) || !self.slug.present?
  end

  def reset_slug_on_errors
    self.slug = nil if self.errors.present?
  end
end