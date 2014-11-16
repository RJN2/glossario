require 'spec_helper'

describe User do
  before { @user = User.new(email: "example.user@ipsos.com", password: "password", password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not from ipsos" do
    before { @user.email = "example.user@utopia.com" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@ipsos,com user_at_foo.org example.user@ipsos.
                     ipsos@bar_baz.com ipsos@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@ipsos.COM A_US-ER@ipsos.com example.user@ipsos.com]
      addresses.each do |valid_address|
        @user.email = valid_address
        should be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end  