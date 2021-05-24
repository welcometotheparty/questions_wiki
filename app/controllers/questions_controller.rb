class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  def index
    @questions = Question.all
  end

  def show
    @answers = Answer.where(question_id: @question.id)
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question, notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Question was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: "Question was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:head, :body)
  end
end
