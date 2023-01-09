class Officer < ApplicationRecord
  extend Pagy::Searchkick
  searchkick

  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged

  has_many :positions, dependent: :destroy
  has_many :agencies, through: :positions

  has_many :roles, dependent: :destroy
  has_many :incidents, through: :roles

  validates :post_id, uniqueness: true

  scope :alphabetical, -> { order(:last_name, :first_name, :middle_name) }
  scope :in_agency, lambda { |agency|
    joins(positions: :agency)
      .where(positions: { agency: agency })
      .distinct
  }

  def name
    [first_name, middle_name, last_name, suffix].compact_blank.join(' ')
  end

  def selection_string
    return name if agencies.empty?

    "#{name} (#{agencies.map(&:short_name).join(', ')})"
  end

  def self.select_choices
    all.map { |officer| [officer.selection_string, officer.id] } +
      [['New officer', 'new_officer']]
  end

  private

  def slug_candidate
    [first_name, last_name, post_id].compact.join(' ')
  end
end
