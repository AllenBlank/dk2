class SynergiesController < ApplicationController
  before_action :set_synergy, only: [:show, :edit, :update, :destroy]

  # GET /synergies
  # GET /synergies.json
  def index
    @synergies = Synergy.all
  end

  # GET /synergies/1
  # GET /synergies/1.json
  def show
  end

  # GET /synergies/new
  def new
    @synergy = Synergy.new
  end

  # GET /synergies/1/edit
  def edit
  end

  # POST /synergies
  # POST /synergies.json
  def create
    @synergy = Synergy.new(synergy_params)

    respond_to do |format|
      if @synergy.save
        format.html { redirect_to @synergy, notice: 'Synergy was successfully created.' }
        format.json { render :show, status: :created, location: @synergy }
      else
        format.html { render :new }
        format.json { render json: @synergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synergies/1
  # PATCH/PUT /synergies/1.json
  def update
    respond_to do |format|
      if @synergy.update(synergy_params)
        format.html { redirect_to @synergy, notice: 'Synergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @synergy }
      else
        format.html { render :edit }
        format.json { render json: @synergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synergies/1
  # DELETE /synergies/1.json
  def destroy
    @synergy.destroy
    respond_to do |format|
      format.html { redirect_to synergies_url, notice: 'Synergy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synergy
      @synergy = Synergy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def synergy_params
      params.require(:synergy).permit(:pile_id, :compliment_id)
    end
end
