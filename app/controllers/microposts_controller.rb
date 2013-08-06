class MicropostsController < ApplicationController
  #is in 1104, timestamp: 6:20
  before_filter :authenticate #if no filter is given it authenticates all the methods
  before_filter :authorized_user, :only => :destroy
  
  def create
    #we are creating microposts using user association because it will have right user id
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      redirect_to root_path, :flash => { :success => "Micropost created!" }
    else
      @feed_items = []
      render 'pages/home'
    end
  end 
  
  def destroy
    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Micropost deleted" }
  end
  
  private
  
  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless current_user?(@micropost.user)
  end
end