class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.integer :round
      t.integer :judge_id
      t.integer :gov_id
      t.integer :opp_id
      t.integer :pm_id
      t.integer :mg_id
      t.integer :lo_id
      t.integer :mo_id
      t.integer :pm_speaks
      t.integer :mg_speaks
      t.integer :lo_speaks
      t.integer :mo_speaks
      t.integer :pm_rank
      t.integer :mg_rank
      t.integer :lo_rank
      t.integer :mo_rank

      t.timestamps null: false
    end
  end
end
