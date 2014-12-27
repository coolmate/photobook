class Album < ActiveRecord::Base
  has_many :pages
  belongs_to :user

  def serializable_hash(options = {})
    super(include: :pages)
  end
end
