require 'acceptance/acceptance_helper'

feature 'Create survey', %q{
  In order to define some questions to answer
  As a statistic enthusiastic
  I want to create a new survey
} do

  let(:survey) { Factory.build :survey }

  scenario 'create empty survey' do
    visit new_survey_url
    fill_in "Name"       , :with => survey.name
    fill_in "Description", :with => survey.description
    click_button "Create Survey"

    page.should have_content "Successfully created survey"
    page.should have_content survey.name
#   page.should have_content survey.description
  end

  scenario 'create survey with 3 questions' do
    visit new_survey_url
    fill_in "Name", :with => survey.name
    click_button "Create Survey"

    questions = 3.times.map { Factory.build :question, :survey => survey }

    questions.each do |question|
      fill_in "Question", :with => question.question
      click_button "Create Question"
    end

    page.should have_content survey.name
#   page.should have_content survey.description

    questions.each do |question|
      page.should have_content question.question
    end
  end
end
