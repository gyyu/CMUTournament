class AdminController < ApplicationController
  before_action :require_admin

  ROOMS = ["PH 126A",
           "PH 225B",
           "PH 226A",
           "PH 226B",
           "PH A18B",
           "PH A18C",
           "PH A19C",
           "PH A19D",
           "PH A21",
           "PH A22",
           "PH A20A",
           "PH A21A",
           "BH 237B",
           "BH 235A",
           "BH 255A",
           "DH 1211",
           "DH 1209",
           "WEH 4627",
           "WEH 4709",
           "WEH 5302"]

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
    @debates = (Team.count) / 2
    @rooms = ROOMS
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
  end

  private
    def require_admin
      unless logged_in_admin?
        flash['danger'] = "You do not have permission for that"
        redirect_to "/"
      end
    end

end
