require 'spec_helper'

describe PagesController do
#because we deleted view files it will render it so we have to render it manually
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    
    it "should have right title" do
      get 'home'
      #have_selector method requires webrat server
      response.should have_selector("title", 
                                    :content => "Ruby on Rails Tutorial Sample App | Home")
    end
    
    it "should have a non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    
    it "should have right title" do
      get 'contact'
      #have_selector method requires webrat server
      response.should have_selector("title", 
                                    :content => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    
    it "should have right title" do
      get 'about'
      #have_selector method requires webrat server
      response.should have_selector("title", 
                                    :content => "Ruby on Rails Tutorial Sample App | About")
    end
  end

end
