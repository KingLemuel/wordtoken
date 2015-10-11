class CreateCredibilitySystems < ActiveRecord::Migration
  def change
    create_table :credibility_systems do |t|
    	t.integer :points
    	t.belongs_to :user

      t.timestamps null: false
    end
  end
end
