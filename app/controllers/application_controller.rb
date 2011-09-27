class ApplicationController < ActionController::Base
  protect_from_forgery

  def new_or_edit_question_answer_path(question, options = {})
    if answer = question.answers.first
      edit_question_answer_path(question, answer, options)
    else
      new_question_answer_path(question, options)
    end
  end
  helper_method :new_or_edit_question_answer_path

  def new_or_edit_question_answer_url(question, options = {})
    if answer = question.answers.first
      edit_question_answer_url(question, answer, options)
    else
      new_question_answer_url(question, options)
    end
  end
  helper_method :new_or_edit_question_answer_url
end
