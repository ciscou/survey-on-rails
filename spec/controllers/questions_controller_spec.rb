require File.dirname(__FILE__) + '/../spec_helper'

describe QuestionsController do
  render_views

  let(:survey)   { Factory :survey }
  let(:question) { Factory :question, :survey => survey }

  it "show action should render show template" do
    get :show, :survey_id => survey, :id => question
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :survey_id => survey
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Question.any_instance.stubs(:valid?).returns(false)
    post :create, :survey_id => survey
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Question.any_instance.stubs(:valid?).returns(true)
    post :create, :survey_id => survey
    response.should redirect_to(survey_question_url(survey, assigns[:question]))
  end

  it "edit action should render edit template" do
    get :edit, :survey_id => survey, :id => question
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Question.any_instance.stubs(:valid?).returns(false)
    put :update, :survey_id => survey, :id => question
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Question.any_instance.stubs(:valid?).returns(true)
    put :update, :survey_id => survey, :id => question
    response.should redirect_to(survey_question_url(survey, assigns[:question]))
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :survey_id => survey, :id => question
    response.should redirect_to(survey)
    Question.exists?(question.id).should be_false
  end
end
