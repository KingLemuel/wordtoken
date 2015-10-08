class CreateUserWordTokens < ActiveRecord::Migration
  def change
    create_table :user_word_tokens do |t|
    	t.belongs_to :receiver
    	t.belongs_to :giver
    	t.belongs_to :word_token


      t.timestamps null: false
    end
  end
end
