Factory.define :survey do |question|
  question.name { Faker::Lorem.sentence }
  question.description { Faker::Lorem.sentences.join("\n") }
end
