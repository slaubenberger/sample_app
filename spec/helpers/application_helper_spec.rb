require 'spec_helper'

include ApplicationHelper


describe ApplicationHelper do

  let(:base_title)    { 'Ruby on Rails Tutorial Sample App' }
  let(:page_title)    { 'Test' }

  describe "full_title" do
    it {full_title(page_title).should eql "#{base_title} | #{page_title}"}

    it {full_title(nil).should eql base_title}

    it {full_title('').should eql base_title}

    it "should include the page title" do
      full_title(page_title).should =~ /#{page_title}/
    end

    it "should include the base title" do
      full_title(page_title).should =~ /^Ruby on Rails Tutorial Sample App/
    end

    it "should not include a bar for the home page" do
      full_title("").should_not =~ /\|/
    end
  end
end 
