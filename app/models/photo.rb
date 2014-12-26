class Photo < ActiveRecord::Base
  belongs_to :page
  validates :shape, inclusion: { in: %w(rounded oval) }
end
