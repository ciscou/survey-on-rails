class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy

  attr_accessible :name, :description
end
