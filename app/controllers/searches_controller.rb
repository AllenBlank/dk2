class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update]

  def index
    @searches = Search.all
  end

  def show
    render full_json
  end

  def create
    @search = Search.new(search_params)
    if @search.save
      render light_json
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  def update
    if @search.update(search_params)
      render full_json
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @search.destroy
    render json: {}
  end

  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:user_id, :name_field, :text_field, :type_field, :format_field, :color_field, :color_exact_field, :sort_by_field, :sort_direction_field)
    end
    
    def full_json
      {
        json: @search.as_json(
          except: [:created_at, :updated_at], 
          methods: [:results] 
        )
      }
    end
    
    def light_json
      { json: @search.as_json( except: [:created_at, :updated_at] ) }
    end

end
