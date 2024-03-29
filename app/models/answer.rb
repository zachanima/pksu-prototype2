class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :is_correct, :name, :question_id

  scope :correct, where('is_correct = ?', true)
end
