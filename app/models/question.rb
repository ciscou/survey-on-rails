class Question < ActiveRecord::Base
  belongs_to :survey
  has_many   :answers

  attr_accessible :survey, :question

  def next
    survey.questions.where("created_at > ?", self.created_at).order(:created_at).first
  end
end
