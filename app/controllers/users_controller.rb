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
  
end
