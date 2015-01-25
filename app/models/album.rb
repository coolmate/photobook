class Album < ActiveRecord::Base
  include Tokenable

  has_many :pages, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
