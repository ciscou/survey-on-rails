require File.dirname(__FILE__) + '/../spec_helper'

describe SurveysController do
  render_views

  let(:survey) { Factory :survey }

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => survey
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Survey.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Survey.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(survey_url(assigns[:survey]))
  end

  it "edit action should render edit template" do
    get :edit, :id => survey
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Survey.any_instance.stubs(:valid?).returns(false)
    put :update, :id => survey
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Survey.any_instance.stubs(:valid?).returns(true)
    put :update, :id => survey
    response.should redirect_to(survey_url(assigns[:survey]))
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => survey
    response.should redirect_to(surveys_url)
    Survey.exists?(survey.id).should be_false
  end
end
