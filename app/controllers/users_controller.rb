class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])#for params ctrl + p in textmate
    @title = @user.name
  end
  
  def new
    @title = "Sign up"
  end
  
end
