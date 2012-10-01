require 'spec_helper'
require_relative '../../app/helpers/application_helper'

class DummyClass
end

describe "Static pages" do

  subject { page }

  before(:all) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(ApplicationHelper)
  end

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Sample App') }
    it { should have_selector('title', text: @dummy_class.full_title(nil)) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: @dummy_class.full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: @dummy_class.full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: @dummy_class.full_title('Contact')) }
  end

  describe "Links page" do
    before { visit links_path }

    it { should have_selector('h1',    text: 'Links') }
    it { should have_selector('title', text: @dummy_class.full_title('Links')) }
  end
end