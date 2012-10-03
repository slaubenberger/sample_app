require 'spec_helper'
require_relative '../../app/helpers/application_helper'

class DummyClass
end

describe "User pages" do

  subject {page}

  before(:all) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(ApplicationHelper)
  end
  
  describe "signup page" do
    before {visit signup_path}

    it {should have_selector('h1',    text: 'Sign up')}
    it {should have_selector('title', text: @dummy_class.full_title('Sign up'))}
  end
end