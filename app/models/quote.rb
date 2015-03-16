class Quote < ActiveRecord::Base
  belongs_to :page

  # nil is left
  validates :justify, inclusion: { in: %w(right center), allow_nil: true }

  validates :size, numericality: {
      allow_nil: true,
      only_integer: true,
      greater_than_or_equal_to: 10,
      less_than_or_equal_to: 30
  }
end
