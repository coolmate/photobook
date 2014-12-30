class Page < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :quotes, dependent: :destroy
  belongs_to :album

  def serializable_hash(options = {})
    super(include: [:photos, :quotes])
  end
end
