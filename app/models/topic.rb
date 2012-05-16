class Topic < ActiveRecord::Base
  attr_accessible :name
  has_many :questions, dependent: :destroy

  validates :name, presence: true
end
