class Search < ActiveRecord::Base
  belongs_to :user
  serialize :colors
  
  def results
    @results = Card.where(newest: true)
    [:name_field, :text_field, :type_field, :format_field].each do |field|
      basic_refine field
    end
    @results.limit(50).as_json only: [:name, :card_type, :text, :flavor, :artist], methods: :image_path
  end
  
  private
    
    def basic_refine field
      dict = {
        name_field:   "name", 
        text_field:   "text", 
        type_field:   "card_type", 
        format_field: "formats"
      }
      
      terms = self.attributes[field.to_s] || ''
      terms.split(' ').each do |term|
        @results = @results.where(
          "cards.#{dict[field]} ILIKE ?", "%#{term}%"
        )
      end
    end
  
end
