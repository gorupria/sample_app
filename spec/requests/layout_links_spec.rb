require 'spec_helper'

describe "LayoutLinks" do
  
  #first one is the special because it has / route
  it  "should have a home page at '/' " do 
       get '/'
       response.should have_selector('title', :content => "Home")
     end
   
  it "should have a conact page at '/contact' " do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
  
  it "should have a about page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
  end
  
 it "should have a help page at '/help' " do
     get '/help'
     response.should have_selector('title', :content => "Help")
  end
  
  it "should have a signup page at '/signup' " do
      get '/signup'
      response.should have_selector('title', :content => "Sign up")
    end
  
  it "should have a right links on the layout" do
      visit root_path
      response.should have_selector('title', :content => "Home")
      click_link "About"
      response.should have_selector('title', :content => "About")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Sign up now!"
      response.should have_selector('title', :content => "Sign up")
      # > sign in line below means there is image in anchor tag 
      response.should have_selector('a[href="/"]>img')
    end
  
  
  
end