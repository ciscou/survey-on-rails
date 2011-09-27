require File.dirname(__FILE__) + '/../spec_helper'

describe AnswersController do
  render_views

  before :each do
    @question = Factory :question
    @answer   = Factory :answer, :question => @question
  end

  it "new action should render new template" do
    get :new, :question_id => @question
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Answer.any_instance.should_receive(:valid?).and_return(false)
    post :create, :question_id => @question
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid and there are no more questions" do
    Answer.any_instance.should_receive(:valid?).and_return(true)
    post :create, :question_id => @question
    response.should redirect_to(survey_url(assigns[:question].survey))
  end

  it "create action should redirect when model is valid and there are more questions" do
    @other_question = Factory :question, :survey => @question.survey
    Answer.any_instance.should_receive(:valid?).and_return(true)
    post :create, :question_id => @question
    response.should redirect_to(new_question_answer_url(@other_question))
  end
end
