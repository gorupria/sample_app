class UsersController < ApplicationController
  #is in 1003, timestamp: 5:00
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    #@users = User.all
    #is in 1004, timestamp: 26:00
    @users = User.paginate(:page => params[:page])
    @title = "All users"
  end
  
  def show
    @user = User.find(params[:id])#for params ctrl + p in textmate
    @title = @user.name
  end
  
  def new
    #is in 0802, timestamp: 5:30
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    #raise params[:user].inspect
    @user = User.new(params[:user])
    if @user.save
      #handle a successful save.
      #flash[:success] = "Welcome to the Sample App!"
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    #raise request.inspect
    #is in 1002, timestamp:5:25 
    #@user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    #@user = User.find(params[:id])
    #is in 1002, timestamp: 28:00
    if @user.update_attributes(params[:user])
      #it worked
      redirect_to @user, :flash => {:success => "Profile updated."}
    else
    @title = "Edit user"
    render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, :flash => { :success => "User destroyed." }
  end
  
  private
  
  def authenticate
    #flash[:notice] = "Please sign in to access this page."
    #The line above is same as the notice below
     deny_access unless signed_in?
  end
  
  #is in 1003, timestamp: 29:00
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    user = User.find(params[:id])
    #redirect_to(root_path) unless (current_user.admin? && !current_user?(user))
    #line above is same as line below
    redirect_to(root_path) if (!current_user.admin? || current_user?(user))
  end
  

end
