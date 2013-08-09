class RelationshipsController < ApplicationController
  before_filter :authenticate
  
  def create
    # To debug -> raise params.inspect
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    #for ajax
    respond_to do |format|
      format.html { redirect_to @user }
      #is in 1203, timestamp: 57:00
      format.js 
    end
    
  end
  
  def destroy
    #is in 1203, timestamp: 52:00
    #relationship = Relationship.find(params[:id]).destroy
    #redirect_to relationship.followed
    #secondary method for line aboce
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js 
    end
  end
end