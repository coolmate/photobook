class Album < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end
