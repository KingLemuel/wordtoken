class CreateWordTokens < ActiveRecord::Migration
  def change
    create_table :word_tokens do |t|
    	t.string :label

      t.timestamps null: false
    end
  end
end
