#Encoding: UTF-8

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  url             :string(255)
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", url: nil)
  end

  subject { @user }

  it { should be_valid }

  context "name" do
    it { should respond_to(:name) }
  
    describe "when name is not present" do
      before { @user.name = " " }
      it { should_not be_valid }
    end
    
    describe "when name is too long" do
      before { @user.name = "a" * 51 }
      it { should_not be_valid }
    end
  end
  
  context "email" do
    it { should respond_to(:email) }
    
    describe "when email is not present" do
      before { @user.email = " " }
      it { should_not be_valid }
    end
    
    describe "when email format is invalid" do
      it "should be invalid" do
	addresses = %w[user@foo,com user_at_foo.org example.user@foo.
		      foo@bar_baz.com foo@bar+baz.com]
	addresses.each do |invalid_address|
	  @user.email = invalid_address
	  @user.should_not be_valid
	end
      end
    end

    describe "when email address is already taken" do
      before do
	user_with_same_email = @user.dup
	user_with_same_email.email = @user.email.upcase
	user_with_same_email.save
      end

      it { should_not be_valid }
    end
  end
  
  context "password" do
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    
    describe "when password is not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
    end
    
    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end
    
    describe "when password confirmation is nil" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
    end
    
    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end
    
    describe "email address with mixed case" do
      let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

      it "should be saved as all lower-case" do
	@user.email = mixed_case_email
	@user.save
	@user.reload.email.should == mixed_case_email.downcase
      end
    end
  end

  context "authentication" do
    it { should respond_to(:authenticate) }
    
    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by_email(@user.email) }

      describe "with valid password" do
	it { should == found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
	let(:user_for_invalid_password) { found_user.authenticate("invalid") }

	it { should_not == user_for_invalid_password }
	specify { user_for_invalid_password.should be_false }
      end
    end
  end
  
  context "url" do
    it { should respond_to(:url) }
    
    describe "when url format is invalid" do
      it "should be invalid" do
	url = %w[user@foo,com ftp://laubenberger.net http://www.laubenberger.network ]
	url.each do |invalid_url|
	  @user.url = invalid_url
	  @user.should_not be_valid
	end
      end
    end
    
    describe "when url format is valid" do
      it "should be valid" do
	url = %w[http://www.laubenberger.net http://www.sss.tw http://strugglingwithruby.blogspot.ch/2009/05/regular-expressions-in-ruby.html]
	url.each do |valid_url|
	  @user.url = valid_url
	  @user.should be_valid
	end
      end
    end
  end
end
