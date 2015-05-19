class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|
      t.integer :card_id
      t.integer :deck_id
      t.integer :count
      t.string :board

      t.timestamps
    end
    add_index :piles, :card_id
    add_index :piles, :deck_id
  end
end
