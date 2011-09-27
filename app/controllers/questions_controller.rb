class QuestionsController < ApplicationController
  before_filter :load_survey

  def show
    @question = @survey.questions.find(params[:id])
  end

  def new
    @question = @survey.questions.new
  end

  def create
    @question = @survey.questions.new(params[:question])
    if @question.save
      redirect_to @survey, :notice => "Successfully created question."
    else
      render :action => 'new'
    end
  end

  def edit
    @question = @survey.questions.find(params[:id])
  end

  def update
    @question = @survey.questions.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to [@survey, @question], :notice  => "Successfully updated question."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @question = @survey.questions.find(params[:id])
    @question.destroy
    redirect_to @survey, :notice => "Successfully destroyed question."
  end

  private

  def load_survey
    @survey = Survey.find(params[:survey_id])
  end
end
