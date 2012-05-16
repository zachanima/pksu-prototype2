class Question < ActiveRecord::Base
  belongs_to :topic
  has_many :answers, dependent: :destroy

  attr_accessible :name, :topic_id, :answers_attributes, :information
  accepts_nested_attributes_for :answers
end
