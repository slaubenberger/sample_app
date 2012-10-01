require_relative '../../app/helpers/application_helper'

  
class DummyClass
end

describe ApplicationHelper do

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(ApplicationHelper)
  end

  describe "#full_title" do
    it "should be equals" do
      @dummy_class.full_title("Hi").should eql "Ruby on Rails Tutorial Sample App | Hi"
    end
  end
end 
