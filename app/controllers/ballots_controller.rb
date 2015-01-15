class BallotsController < ApplicationController

  def rounds
    @rounds = Ballot.all.group_by(&:round).sort
    puts "Rounds"
    puts @rounds
  end

end