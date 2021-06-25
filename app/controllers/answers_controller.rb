class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]

  def index
    @answers = Answer.all
  end

  def show

  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer = current_user.answers.new(answer_params)

    if @answer.save
      flash[:success] = "Ответ добавлен"
    else
      flash[:errors] = @answer.errors
    end
    redirect_back(fallback_location: question_path(answer_params[:question_id]))
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: "Answer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
    redirect_to answers_url, notice: "Answer was successfully destroyed."
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :title, :question_id)
  end
end
