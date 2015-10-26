class UpdateSpeaksPrecision < ActiveRecord::Migration
  def change
    change_column :ballots, :pm_speaks, :decimal, precision: 4, scale: 2
    change_column :ballots, :mg_speaks, :decimal, precision: 4, scale: 2
    change_column :ballots, :lo_speaks, :decimal, precision: 4, scale: 2
    change_column :ballots, :mo_speaks, :decimal, precision: 4, scale: 2
  end
end
