class QuestionsController < ApplicationController
  before_filter :load_survey

  def create
    @question = @survey.questions.new(params[:question])
    if @question.save
      redirect_to @survey, :notice => "Successfully created question."
    else
      render :template => 'surveys/show'
    end
  end

  private

  def load_survey
    @survey = Survey.find(params[:survey_id])
  end
end
