class Cards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :definition
      t.string :word
      t.references :deck
    end
  end
end
