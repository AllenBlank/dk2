class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :name
      t.string :code
      t.string :block
      t.datetime :release_date

      t.timestamps
    end
  end
end
