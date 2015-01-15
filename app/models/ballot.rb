class Ballot < ActiveRecord::Base
  belongs_to :gov, class_name: "User"
  belongs_to :opp, class_name: "User"
  belongs_to :judge, class_name: "User"
end
