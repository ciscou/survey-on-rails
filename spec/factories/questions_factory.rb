Factory.define :question do |question|
  question.survey { Factory :survey }
  question.question { Faker::Lorem.sentence }
end
