class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id])#for params ctrl + p in textmate
  end
  
  def new
    @title = "Sign up"
  end
  
end
