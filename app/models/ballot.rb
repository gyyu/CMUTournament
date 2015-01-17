class Ballot < ActiveRecord::Base
  belongs_to :gov, class_name: "Team"
  belongs_to :opp, class_name: "Team"
  belongs_to :judge, class_name: "User"
  belongs_to :winner, class_name: "Team"
end
