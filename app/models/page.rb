class Page < ActiveRecord::Base
  has_many :photos
  has_many :quotes
  belongs_to :album

  def serializable_hash(options = {})
    super(include: [:photos, :quotes])
  end
end
