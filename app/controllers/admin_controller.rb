class AdminController < ApplicationController

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
    puts "HERE"
    redirect_to "/admin/new_ballot"
  end

  def new_round
    @teams = Team.all
    @judges = User.where(:user_type => 'judge')
  end

end
