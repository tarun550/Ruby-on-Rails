class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  def show
  @user = User.find(params[:id])
  @title = @user.name
  @sellprops = @user.sellprops.all
  @show_heading=0
  end
  def bids
  @user = User.find(params[:id])
  @bids=@user.bids.all
  @current=Sellprop.all
  end
  def new
  @user = User.new
  @title = "Sign up"
  end
  def index
  @title = "All users"
  @users = User.all
  end
  def create
	@user = User.new(params[:user])
	if @user.save
	sign_in @user
	flash.now[:success] = "Thank You for logging in!"
	redirect_to @user
	else
	@title = "Sign up"
	render 'new'
	end	
	end

  def edit
	@user = User.find(params[:id])
	@title = "Edit user"
  end
  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	flash[:success] = "Profile updated."
	redirect_to @user
	else
	@title = "Edit user"
	render 'edit'
	end
	end
  before_filter :authenticate, :only => [:edit, :update]
  private
  def authenticate
  deny_access unless signed_in?
  end
  def correct_user
  @user = User.find(params[:id])
  redirect_to(root_path) unless current_user?(@user)
  end
end	