require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Home")
    end
  end
  
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end

    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Help")
    end
  end
  
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it "should have the right title" do
    visit '/static_pages/about'
    page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
  
  describe "Link page" do

    it "should have the content 'Links'" do
      visit '/static_pages/links'
      page.should have_content('Links')
    end
    
    it "should have the content 'Links'" do
      visit '/static_pages/links'
      #puts "Hi there 1; " << page.find(:id, 'mainheader').text
      #puts "Hi there 2; " << page.find(:xpath, '//h1').text
      page.find(:id, 'mainheader').text.should have_content('Links')
   end
    
    it "should have the right title" do
      visit '/static_pages/links'
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Links")
    end
  end
end
