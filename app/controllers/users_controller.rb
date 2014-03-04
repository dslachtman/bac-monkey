class UsersController < ApplicationController
  before_filter :check_authentication, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @history = current_user.past_week_consumption
  end

end