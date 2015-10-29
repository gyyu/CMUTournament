class Ballot < ActiveRecord::Base
  belongs_to :gov, class_name: "Team"
  belongs_to :opp, class_name: "Team"
  belongs_to :judge, class_name: "User"
  belongs_to :winner, class_name: "Team"

  def winner_side
    if self.winner.nil?
      return ""
    elsif self.winner.name == self.opp.name
      return "(Opp)"
    else
      return "(Gov)"
    end
  end
end
