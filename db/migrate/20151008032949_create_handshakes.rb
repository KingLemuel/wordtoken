class CreateHandshakes < ActiveRecord::Migration
  def change
    create_table :handshakes do |t|
    	t.belongs_to :user
    	t.belongs_to :connection

      t.timestamps null: false
    end
  end
end
