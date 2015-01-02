class Photo < ActiveRecord::Base
  belongs_to :page

  # nil is square
  validates :shape, inclusion: { in: %w(rounded oval), allow_nil: true }
end
