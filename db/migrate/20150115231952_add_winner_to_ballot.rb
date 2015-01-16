class AddWinnerToBallot < ActiveRecord::Migration
  def change
    add_column :ballots, :winner_id, :integer
    add_column :ballots, :rfd, :text
    add_column :ballots, :submitted, :boolean, :null => false, :default => false
    add_column :ballots, :released, :boolean, :null => false, :default => false
    add_column :ballots, :results_released, :boolean, :null => false, :default => false
  end
end
