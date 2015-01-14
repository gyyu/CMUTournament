class AddIndexesToBallots < ActiveRecord::Migration
  def change
    add_index :ballots, :round, unique: false
    add_index :ballots, :gov_id, unique: false
    add_index :ballots, :opp_id, unique: false
    add_index :ballots, :judge_id, unique: false
  end
end
