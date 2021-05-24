class CorrectionsController < ApplicationController
  before_action :set_correction, only: %i[ show edit update destroy ]

  # GET /corrections or /corrections.json
  def index
    @corrections = Correction.all
  end

  # GET /corrections/1 or /corrections/1.json
  def show
  end

  # GET /corrections/new
  def new
    @correction = Correction.new
  end

  # GET /corrections/1/edit
  def edit
  end

  # POST /corrections or /corrections.json
  def create
    @correction = current_user.corrections.new(correction_params)

    respond_to do |format|
      if @correction.save
        format.html { redirect_to @correction, notice: "Correction was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corrections/1 or /corrections/1.json
  def update
    respond_to do |format|
      if @correction.update(correction_params)
        format.html { redirect_to @correction, notice: "Correction was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corrections/1 or /corrections/1.json
  def destroy
    @correction.destroy
    respond_to do |format|
      format.html { redirect_to corrections_url, notice: "Correction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_correction
      @correction = Correction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def correction_params
      params.require(:correction).permit(:body, :is_accepted, :question_id, :answer_id)
    end
end
