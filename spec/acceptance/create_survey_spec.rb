require 'acceptance/acceptance_helper'

feature 'Create survey', %q{
  In order to define some questions to answer
  As a statistic enthusiastic
  I want to create a new survey
} do

  scenario 'create empty survey' do
    visit new_survey_url
    fill_in "Name", :with => "Lorem ipsum"
    click_button "Create Survey"

    page.should have_content "Successfully created survey"
    page.should have_content "Lorem ipsum"
  end

  scenario 'create empty survey with 3 questions' do
    visit new_survey_url
    fill_in "Name", :with => "Lorem ipsum"
    click_button "Create Survey"

    3.times do |i|
      click_link "Add a question"
      fill_in "Question", :with => "Question #{i+1}"
      click_button "Create Question"
      click_link "Back to survey"
    end

    page.should have_content "Lorem ipsum"
    3.times do |i|
      page.should have_content "Question #{i+1}"
    end
  end
end
