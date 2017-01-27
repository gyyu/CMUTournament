class AdminController < ApplicationController
  before_action :require_admin

  def make_judge
    @users = User.where(:user_type => nil, :team_id => nil)
  end

  def new_judge
    user = User.find(params["to_judge"])
    user.update(:user_type => 'judge')
    @users = User.where(:user_type => nil, :team_id => nil)
    puts user.name
    redirect_to "/admin/make_judge"
  end

  def new_ballot
    @teams = Team.all
    @judges = User.where(:user_type => 'judge')
  end

  def create_ballot
    redirect_to "/admin/new_ballot"
  end

  def make_round
    @teams = Team.all.order('name ASC')
    @judges = User.where(:user_type => 'judge').order(:name)
    @judges += User.where(:user_type => 'admin').order(:name)
    @debates = (Team.count) / 2
    @rooms = Room.all.map {|r| r.room_name}
  end

  def create_round
    @teams = Team.all
    @judges = User.where(:user_type => 'judge')
    ballots = params['ballots']
    round = params['round'].to_i
    ballots.each do |k, d|
      b = Ballot.new(:judge_id => d['judge'].to_i,
                     :gov_id => d['gov'].to_i,
                     :opp_id => d['opp'].to_i,
                     :room => d['room'],
                     :round => round)
      puts "Error on #{k}, #{b.errors}" unless b.save
    end
    redirect_to "/rounds"
  end

  def status
    @rounds = Ballot.all.group_by(&:round).sort
    @selected = @rounds.count > 0 ? @rounds.last[0] : 1
  end

  def round_report
    @rounds = Ballot.all.group_by(&:round).sort
    @selected = @rounds.count > 0 ? @rounds.last[0] : 1
  end

  def release_results
    #add error handling here
    @round = params['round'].to_i
    ballots = Ballot.where(:round => @round)
    ballots.each do |b|
      #add exceptions for teams that don't want public results
      b.update_attribute(:released, true)
      b.update_attribute(:results_released, true)
    end
  end

  def add_room
    name = params["room_name"]
    unless name.blank?
      Room.new(:room_name => name)
    end
  end

end
