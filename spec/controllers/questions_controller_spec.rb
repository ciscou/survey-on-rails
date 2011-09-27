require File.dirname(__FILE__) + '/../spec_helper'

describe QuestionsController do
  render_views

  before :each do
    @survey   = Factory :survey
  end

  it "create action should render new template when model is invalid" do
    Question.any_instance.should_receive(:valid?).and_return(false)
    post :create, :survey_id => @survey
    response.should render_template('surveys/show')
  end

  it "create action should redirect when model is valid" do
    Question.any_instance.should_receive(:valid?).and_return(true)
    post :create, :survey_id => @survey
    response.should redirect_to(@survey)
  end
end
