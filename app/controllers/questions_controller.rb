class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    #render plain: params
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Question save'
      redirect_to questions_path
    else
      render :new
    end
    # @question.save ? redirect_to questions_path : render :new
  end

  def edit
    @question = Question.find_by(id: params[:id]) # или Question.find(params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
