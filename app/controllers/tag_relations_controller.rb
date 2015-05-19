class TagRelationsController < ApplicationController
  before_action :set_tag_relation, only: [:show, :edit, :update, :destroy]

  # GET /tag_relations
  # GET /tag_relations.json
  def index
    @tag_relations = TagRelation.all
  end

  # GET /tag_relations/1
  # GET /tag_relations/1.json
  def show
  end

  # GET /tag_relations/new
  def new
    @tag_relation = TagRelation.new
  end

  # GET /tag_relations/1/edit
  def edit
  end

  # POST /tag_relations
  # POST /tag_relations.json
  def create
    @tag_relation = TagRelation.new(tag_relation_params)

    respond_to do |format|
      if @tag_relation.save
        format.html { redirect_to @tag_relation, notice: 'Tag relation was successfully created.' }
        format.json { render :show, status: :created, location: @tag_relation }
      else
        format.html { render :new }
        format.json { render json: @tag_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_relations/1
  # PATCH/PUT /tag_relations/1.json
  def update
    respond_to do |format|
      if @tag_relation.update(tag_relation_params)
        format.html { redirect_to @tag_relation, notice: 'Tag relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_relation }
      else
        format.html { render :edit }
        format.json { render json: @tag_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_relations/1
  # DELETE /tag_relations/1.json
  def destroy
    @tag_relation.destroy
    respond_to do |format|
      format.html { redirect_to tag_relations_url, notice: 'Tag relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_relation
      @tag_relation = TagRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_relation_params
      params.require(:tag_relation).permit(:tag_id, :pile_id, :deck_id, :synergy_id)
    end
end
