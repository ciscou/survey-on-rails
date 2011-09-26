class Question < ActiveRecord::Base
  belongs_to :survey

  attr_accessible :survey, :question
end
