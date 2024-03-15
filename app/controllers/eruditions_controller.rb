class EruditionsController < ApplicationController
  before_action :set_erudition, only: %i[ show edit update destroy ]

  # GET /eruditions or /eruditions.json
  def index
    @eruditions = Erudition.all
  end

  # GET /eruditions/1 or /eruditions/1.json
  def show
  end

  # GET /eruditions/new
  def new
    @erudition = Erudition.new
  end

  # GET /eruditions/1/edit
  def edit
  end

  # POST /eruditions or /eruditions.json
  def create
    @erudition = Erudition.new(erudition_params)

    respond_to do |format|
      if @erudition.save
        format.html { redirect_to erudition_url(@erudition), notice: "Erudition was successfully created." }
        format.json { render :show, status: :created, location: @erudition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @erudition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eruditions/1 or /eruditions/1.json
  def update
    respond_to do |format|
      if @erudition.update(erudition_params)
        format.html { redirect_to erudition_url(@erudition), notice: "Erudition was successfully updated." }
        format.json { render :show, status: :ok, location: @erudition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @erudition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eruditions/1 or /eruditions/1.json
  def destroy
    @erudition.destroy!

    respond_to do |format|
      format.html { redirect_to eruditions_url, notice: "Erudition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_erudition
      @erudition = Erudition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def erudition_params
      params.require(:erudition).permit(:title, :description)
    end
end
