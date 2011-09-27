class AnswersController < ApplicationController
  before_filter :load_question

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect_to_next_question_or_finish :notice => "Successfully created answer."
    else
      render :action => 'new'
    end
  end

  def edit
    @answer = @question.answers.find(params[:id])
  end

  def update
    @answer = @question.answers.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to_next_question_or_finish :notice => "Successfully updated answer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answers_url, :notice => "Successfully destroyed answer."
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def redirect_to_next_question_or_finish(options = {})
    if next_question = @question.next
      redirect_to new_or_edit_question_answer_url(next_question), options
    else
      redirect_to @question.survey, :notice => "Thank you for taking this survey!"
    end
  end
end
