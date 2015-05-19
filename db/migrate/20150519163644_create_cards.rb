class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :expansion_id
      t.string :card_type
      t.text :types
      t.text :colors
      t.string :name
      t.string :rarity
      t.float :cmc
      t.string :mana_cost
      t.text :text
      t.text :flavor
      t.string :artist
      t.text :rulings
      t.integer :number
      t.float :power
      t.float :toughness
      t.boolean :reserved
      t.string :original_type
      t.text :original_text
      t.float :loyalty
      t.boolean :newest
      t.text :color_id
      t.text :formats

      t.timestamps
    end
    add_index :cards, :expansion_id
    add_index :cards, :name
    add_index :cards, :newest
  end
end
