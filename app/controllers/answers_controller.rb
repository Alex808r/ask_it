# frozen_string_literal: true

class AnswersController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_question!, only: %i[create destroy edit update]
  before_action :set_answer!, except: %i[create]

  def create
    # render plain: params
    # @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      flash[:success] = 'Answer created'
      redirect_to question_path(@question)
    else
      # @answers = @question.answers.order created_at: :desc # для отображения всех ответов
      @answers = @question.answers.order(created_at: :desc).page(params[:page]) # решение ошибки
      # NoMethodError in Answers#create
      render 'questions/show'
    end
  end

  def edit
    # @answer = @question.answers.find(params[:id])
  end

  def update
    # @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question, anchor: dom_id(@answer))
    else
      @answers = @question.answers.order created_at: :desc # для отображения всех ответов
      render :edit
    end
  end

  def destroy
    # @answer = @question.answers.find(params[:id])
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find(params[:question_id])
  end

  def set_answer!
    @answer = @question.answers.find(params[:id])
  end
end
