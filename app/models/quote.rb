class Quote < ActiveRecord::Base
  belongs_to :page

  # nil is left
  validates :justify, inclusion: { in: %w(right center), allow_nil: true }
end
