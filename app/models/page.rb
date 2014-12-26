class Page < ActiveRecord::Base
  has_many :photos
  has_many :quotes
  belongs_to :album

  def serializable_hash(options = {})
    hash = super
    hash[:photos] = photos.map(&:id)
    hash[:quotes] = quotes.map(&:id)
    hash
  end
end
