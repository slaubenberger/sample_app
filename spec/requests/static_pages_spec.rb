require 'spec_helper'

include ApplicationHelper

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it {should have_selector('h1',    text: heading)}

    it {should have_selector('title', text: 		full_title(page_title))}
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    let(:heading)    { 'About Us' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
    
    # FIXME: what is going on here? Why does this test pass without passing :-o ?
    #puts "MUUUUH"

    #page.should have_selector('h1') do |text|
    it { have_selector('h1') do |text|
      #puts "TEXT:" + text
      text.should =~ /\AAbout\z/
    end}

  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  describe "Links page" do
    before { visit links_path }

    let(:heading)    { 'Links' }
    let(:page_title) { 'Links' }

    it_should_behave_like "all static pages"
  end
  
  it "should have the right links on the layout" do
    visit root_path
    
    # FIXME: why is here the page needed - i don't get it...
    click_link "About"
    #it {should have_selector('title', text: full_title('About Us'))}
    page.should have_selector 'title', text: full_title('About Us')

    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')

    click_link "Links"
    page.should have_selector 'title', text: full_title('Links')

    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
#     
#     click_link "Home"
#     click_link "Sign up now!"
#     page.should # fill in
#     click_link "sample app"
#    page.should # fill in
  end
end