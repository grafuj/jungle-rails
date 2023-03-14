require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before :each do
    @user = User.create(name: "Joe Smith", email: "jsmith@gmail.com", password: "fse906", password_confirmation: "fse906")
  end

  describe 'User Validations' do
    it "should be valid with all valid attributes" do
      expect(@user).to be_valid
    end

    it "should be invalid without a name" do
      @user.name = nil
      @user.save
      # byebug to see specifics
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "should be invalid without an email" do
      @user.email = nil
      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it "should be invalid without a password" do
      @user.password = nil
      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it "should be invalid with incorrect password confirmation" do
      @user.password_confirmation = "123"
      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it "should be invalid with an existing email" do
      user2 = User.create(name: "Jim", email: "jsmith@gmail.com", password: "123", password_confirmation: "123")
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages[0]).to eq("Email has already been taken")
    end
    
    it "should be invalid with an existing email when uppercase" do
      user2 = User.create(name: "Jim", email: "JSMITH@gmail.com", password: "123", password_confirmation: "123")
      expect(user2).not_to be_valid
      expect(user2.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it "should be invalid with a password less than 6 characters" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should authenticate correct credentials" do
      User.authenticate_with_credentials(@user.email, @user.password)
    end

    it "should authenticate with spaced credentials" do
      # we can't use direct setting of values like on 57 to 59
      User.authenticate_with_credentials("       jsmith@gmail.com     ", @user.password)
    end

    it "should authenticate with incorrectly cased credentials" do
      User.authenticate_with_credentials("JSMitH@gmail.com", @user.password)
    end
  end
end
