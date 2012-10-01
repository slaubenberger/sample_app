require_relative '../../app/helpers/application_helper'

class DummyClass
end

describe ApplicationHelper do

  base_title = "Ruby on Rails Tutorial Sample App"

  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(ApplicationHelper)
  end

  describe "#full_title" do
    it {@dummy_class.full_title("Test").should eql "#{base_title} | Test"}

    it {@dummy_class.full_title(nil).should eql base_title}

    it {@dummy_class.full_title('').should eql base_title}
  end
end 
