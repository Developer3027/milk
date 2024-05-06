class ThatchesController < ApplicationController
  before_action :set_thatch, only: %i[ show edit update destroy ]

  # GET /thatches or /thatches.json
  def index
    @thatches = Thatch.all
    p @thatches
  end

  # GET /thatches/1 or /thatches/1.json
  def show
  end

  # GET /thatches/new
  def new
    @thatch = Thatch.new
  end

  # GET /thatches/1/edit
  def edit
  end

  # POST /thatches or /thatches.json
  def create
    @thatch = Thatch.new(thatch_params)
    @thatch.user = current_user

    respond_to do |format|
      if @thatch.save
        format.html { redirect_to thatch_url(@thatch), notice: "Thatch was successfully created." }
        format.json { render :show, status: :created, location: @thatch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thatches/1 or /thatches/1.json
  def update
    respond_to do |format|
      if @thatch.update(thatch_params)
        format.html { redirect_to thatch_url(@thatch), notice: "Thatch was successfully updated." }
        format.json { render :show, status: :ok, location: @thatch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @thatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thatches/1 or /thatches/1.json
  def destroy
    @thatch.destroy!

    respond_to do |format|
      format.html { redirect_to thatches_url, notice: "Thatch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thatch
      @thatch = Thatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thatch_params
      params.require(:thatch).permit(:song_title, :artist, :year, :album_art, :song)
    end
end
