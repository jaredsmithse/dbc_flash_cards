class Cards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :definition
      t.string :word
      t.reference :deck
    end
  end
end
