class ChallengesController < ApplicationController
  def index
  end

  def new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    challenger = User.find_by_email(params[:challenger_email])
    if challenger
      challenge = @user.challenges.create(challenger_id: challenger.id, start_date: params[:start_date], end_date: params[:end_date])
      redirect_to user_challenges_path(@user)
    else
      @errors = "There is no challenger with that email."
      render :new
    end
  end
end