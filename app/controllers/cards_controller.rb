class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def show
    render json: @card.as_json( 
      except: [:created_at, :updated_at], 
      methods: [:image_path] 
    )
  end
  
  private
    def set_card
      @card = Card.find(params[:id])
    end
end
