class BallotsController < ApplicationController

  def rounds
    @rounds = Ballot.all.group_by(&:round).sort
    puts "Rounds"
    puts @rounds
  end

  def show
    @ballot = Ballot.find(params["ballot_id"])
    unless @ballot.results_released ||
          logged_in_admin? || @ballot.judge_id == current_user.id
      flash['danger'] = "That ballot has not been released yet"
      redirect_to "/"
    end
  end

  def edit
    @ballot = Ballot.find(params["ballot_id"])
    unless logged_in_admin?
      if @ballot.judge != current_user
        flash['danger'] = "You do not have permission to do that"
        redirect_to root_path
      elsif @ballot.submitted
        redirect_to "/ballot/#{@ballot.id}"
      end
    end
  end

  def submit
    puts params
    @ballot = Ballot.find(params["ballot_id"])
    @ballot.update_attributes(ballot_params)
    @ballot.submitted = true
    if @ballot.save
      redirect_to "/rounds"
    else
      flash.now['danger'] = @ballot.errors
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