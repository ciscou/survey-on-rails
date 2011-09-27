class Question < ActiveRecord::Base
  belongs_to :survey
  has_many   :answers, :dependent => :destroy

  attr_accessible :question

  def next
    survey.questions.where("created_at > ?", self.created_at).order(:created_at).first
  end
end
