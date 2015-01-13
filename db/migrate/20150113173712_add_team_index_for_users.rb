class AddTeamIndexForUsers < ActiveRecord::Migration
  def change
    add_index :users, :team_id, unique: false
  end
end
