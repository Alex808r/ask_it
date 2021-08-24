class QuestionsController < ApplicationController

  before_action :set_question!, only: %i[show edit update destroy ] # вынесли общий код в метод и определили загрузку
  # метода для нужных action

  def index
    @questions = Question.all
  end

  def show
    # @question = Question.find_by(id: params[:id])
    @answer = @question.answers.build
    @answers = @question.answers.order created_at: :desc # для отображения всех ответов
    # @answers = Answer.where(question_id: @question.id).order created_at: :desc - для отображения всех ответов альтернативная запись
    # @answers = Answer.where(question: @question).limit(2).order created_at: :desc - для отображения всех ответов альтернативная запись c лимитом 2 записи


  end

  def new
    @question = Question.new
  end

  def create
    #render plain: params
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end
    # @question.save ? redirect_to questions_path : render :new
  end

  def edit
    # @question = Question.find_by(id: params[:id]) # или Question.find(params[:id])
  end

  def update
    # @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    # @question = Question.find_by(id: params[:id])
    @question.destroy
    flash[:success] = "Question destroy!"
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find(params[:id]) #RecordNotFound если запись не найдена.
    # @question = Question.find_by(id: params[:id]) аналогичная запись/ Если вопрос с id не будет найден, получим ошибку
    # NoMethodError. Поэтому лучше использовать Question.find(params[:id])
  end
end
