require 'acceptance/acceptance_helper'

feature 'Take survey', %q{
  In order to know more about myself
  As a curious person with a lot of spare time
  I want to take a survey
} do

  background do
    @survey = Factory :survey
    3.times { Factory :question, :survey => @survey }
  end

  scenario 'Basic survey with 3 questions' do
    visit survey_url @survey
    click_link "Take survey!"

    answers = 3.times.map { Faker::Lorem.sentence }
    answers.each do |answer|
      fill_in "Answer", :with => answer
      click_button "Create Answer"
    end

    page.should have_content "Thank you for taking this survey!"
    answers.each do |answer|
      page.should have_content answer
    end
  end

end
