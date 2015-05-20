class ExpansionImporter
  attr_accessor :hash, :create_hash, :cards

  def initialize path
    file = File.new path, 'r'
    @hash = JSON.parse file.read
    file.close
    @cards = @hash["cards"]
    @hash["cards"] = nil
  end
  
  def create_expansion
    conversion_hash = {name: "name", code: "magicCardsInfoCode", release_date: "releaseDate", block: "block"}
    @create_hash = {} 
    conversion_hash.each { |k,v| @create_hash[k] = @hash[v] }
    
    fix_release_date
    
    Expansion.create @create_hash
  end
  
  private
    def fix_release_date
      @create_hash[:release_date] = @create_hash[:release_date].to_date
    end
end

class CardImporter
  
  attr_accessor :hash, :create_hash, :expansion
  def initialize card_hash, expansion
    @hash = card_hash
    @expansion = expansion
    @create_hash = {}
  end
  
  def create_card
    conversion_hash = {
      name: "name",
      mana_cost: "manaCost",
      cmc: "cmc",
      colors: "colors",
      card_type: "type",
      types: "types",
      rarity: "rarity",
      text: "text",
      flavor: "flavor",
      artist: "artist",
      number: "number",
      power: "power",
      toughness: "toughness",
      loyalty: "loyalty",
      reserved: "reserved",
      rulings: "rulings",
      original_text: "originalText",
      original_type: "originalType",
    }
    
    conversion_hash.each { |k,v| @create_hash[k] = @hash[v] }
    
    card = Card.create @create_hash
    
    @expansion.cards << card
    
    set_newest card
    set_color card
    set_color_id card
    set_formats card
    
    card
    
  end
  
  private
  
    def set_newest card
      contender = Card.where(name: card.name, newest: true).first
      if contender
        if contender.expansion.release_date < card.expansion.release_date
          contender.update newest: false
          card.update newest: true
        else
          card.update newest: false
        end
      else
        card.update newest: true
      end
    end
    
    def set_color card
      
      if card.colors == nil
        card.colors = []
        card.colors << "Colorless"
        card.save
      end
      
    end
    
    def set_color_id card
      card.color_id = []
      card.colors.each do |color|
        card.color_id << color
      end
      
      return card.save if card.text.nil?
      
      colors = {
        "White" => "W",
        "Blue"  => "U",
        "Black" => "B",
        "Red"   => "R",
        "Green" => "G"
      }
      
      colors.each do |name,char|
        if card.text["{" + char] || card.text[char + "}"]
          card.color_id << name
        end
      end
      
      card.save
      
    end
    
    def set_formats card
      card.formats = []
      @hash["legalities"].each do |k,v|
        if v == "Restricted" ||  v == "Legal"
          card.formats << k
        end
      end
      card.save
    end
end



path = Rails.root.to_s + '/db/json-source/'
count = 0
Dir.foreach(path) do |file_name| 
  count += 1
  break if count > 10
  
  next if file_name == '.' or file_name == '..'
  
  exp_imp = ExpansionImporter.new(path + file_name)

  expansion = exp_imp.create_expansion

  exp_imp.cards.each do |card_hash|
    card_imp = CardImporter.new(card_hash, expansion)
    card = card_imp.create_card
  end
end

