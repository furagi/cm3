class SessionsController < ApplicationController

  before_action :require_user, only: [:destroy]

  respond_to :html

  def new
    @title = "Login"
  end

  def create
    @user = Gtf::User.authenticate(params[:session][:username], params[:session][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = 'Wrong username or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private
    def permitted_params
      {session: params.permit(:username, :password) }
    end
end
