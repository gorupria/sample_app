class PagesController < ApplicationController
  #learn inject in ruby
  def home
    @title = "Home"
    #is in 1104, timestamp: 20:31
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def login
    @title = "Sign In"
  end
end
