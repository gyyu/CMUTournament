class AddRoomToBallots < ActiveRecord::Migration
  def change
    add_column :ballots, :room, :string
  end
end
