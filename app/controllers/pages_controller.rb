class PagesController < ApplicationController
  #learn inject in ruby
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
end
