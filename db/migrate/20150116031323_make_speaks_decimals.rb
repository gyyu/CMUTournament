class MakeSpeaksDecimals < ActiveRecord::Migration
  def change
    change_column :ballots, :pm_speaks, :decimal
    change_column :ballots, :mg_speaks, :decimal
    change_column :ballots, :lo_speaks, :decimal
    change_column :ballots, :mo_speaks, :decimal
  end
end
