class Album < ActiveRecord::Base
  has_many :pages
  belongs_to :user
end
