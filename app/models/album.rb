class Album < ActiveRecord::Base
  has_many :pages, dependent: :destroy
  belongs_to :user
end
