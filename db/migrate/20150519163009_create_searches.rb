class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.text :name_field
      t.text :text_filed
      t.text :type_field
      t.text :format_field
      t.text :color_field
      t.boolean :color_exact_field
      t.string :sort_by_field
      t.string :sort_direction_field

      t.timestamps
    end
    add_index :searches, :user_id
  end
end
