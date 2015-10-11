class AddCredibilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :credibility, :integer
  end
end

