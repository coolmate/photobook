class Album < ActiveRecord::Base
  has_many :pages

  def serializable_hash(options = {})
    super(include: :pages)
  end
end
