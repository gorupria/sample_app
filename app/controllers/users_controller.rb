class UsersController < ApplicationController
  
  def new
    @title = "Sign up"
  end
  
  def show
    @user = User.find(params[:id])#for params ctrl + p in textmate
  end
  
end
