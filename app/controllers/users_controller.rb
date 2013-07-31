class UsersController < ApplicationController
  
  
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
    #is in 1002, timestamp:5:25 
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    #is in 1002, timestamp: 28:00
    if @user.update_attributes(params[:user])
      #it worked
      redirect_to @user, :flash => {:success => "Profile updated."}
    else
    @title = "Edit user"
    render 'edit'
    end
  end
end
