require 'spec_helper'

describe PagesController do
#because we deleted view files it will render it so we have to render it manually
  render_views
  
  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    
    describe "when not signed in" do
      
      it "returns http success" do
        get 'home'
        response.should be_success
      end
    
      it "should have right title" do
        get 'home'
        #have_selector method requires webrat server
        response.should have_selector("title", 
                                    :content => "#{@base_title} | Home")
      end
    
      it "should have a non-blank body" do
        get 'home'
        response.body.should_not =~ /<body>\s*<\/body>/
      end
    end
  
    describe "when signed in" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        other_user = Factory(:user, :email => Factory.next(:email))
        other_user.follow!(@user)
      end
      
      it "should have a right follower/following counts " do
        get :home
        response.should have_selector('a', :href => following_user_path(@user),
                                           :content => "0 following")
        response.should have_selector('a', :href => followers_user_path(@user),
                                           :content => "1 follower")
      end
      
      
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
                                    :content => "#{@base_title} | Contact")
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
                                    :content => "#{@base_title} | About")
    end
  end
  
  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
    
    it "should have right title" do
      get 'help'
      #have_selector method requires webrat server
      response.should have_selector("title", 
                                    :content => "#{@base_title} | Help")
    end
  end

end
