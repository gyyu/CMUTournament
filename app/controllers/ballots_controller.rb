class BallotsController < ApplicationController

  def rounds
    @rounds = Ballot.all.group_by(&:round).sort
    puts "Rounds"
    puts @rounds
  end

  def show
    @ballot = Ballot.find(params["ballot_id"])
  end

  def edit
    @ballot = Ballot.find(params["ballot_id"])
    # if @ballot.submitted and !(logged_in_admin?)
    #   render been_submitted
    # end
  end

  def submit
    puts params
    @ballot = Ballot.find(params["ballot_id"])
    @ballot.update_attributes(ballot_params)
    @ballot.submitted = true
    if @ballot.save
      redirect_to "/rounds"
    else
      flash.now['error'] = @ballot.errors
    end
  end

  private

    def ballot_params
      params.require(:ballot).permit(:pm_id, :pm_speaks, :pm_rank,
                                     :mg_id, :mg_speaks, :mg_rank,
                                     :lo_id, :lo_speaks, :lo_rank,
                                     :mo_id, :mo_speaks, :mo_rank,
                                     :pm_id, :pm_speaks, :pm_rank,
                                     :winner_id, :rfd)
    end

end