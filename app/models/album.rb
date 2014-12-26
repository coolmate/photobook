class Album < ActiveRecord::Base
  has_many :pages

  def serializable_hash(options = {})
    hash = super
    hash[:pages] = pages.map(&:id)
    hash
  end
end
