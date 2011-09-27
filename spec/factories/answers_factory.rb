Factory.define :answer do |answer|
  answer.question { Factory :question }
  answer.answer   { Faker::Lorem.sentence }
end
