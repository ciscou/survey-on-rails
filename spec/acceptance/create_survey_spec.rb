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

end
