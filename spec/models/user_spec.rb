require "spec_helper"

describe User do
  describe "User model validations" do

    it "is invalid without an email" do
      user = User.new(email: nil)
      expect(user).to have(1).errors_on(:email)
    end
    
    it "is invalid without a password" do
      user = User.new(password: nil)
      expect(user).to have(1).errors_on(:password)
    end

    it "is invalid without a password_confirmation" do
      user = User.new(password_confirmation: nil)
      expect(user).to have(1).errors_on(:password_confirmation)
    end

    it "is invalid when two users have the same email" do
      User.create(
        email: "hyd@123.com",
        password: "asdf",
        password_confirmation: "asdf")
      
      user = User.new(
        email: "hyd@123.com",
        password: "1234",
        password: "1234")

      expect(user).to have(1).errors_on(:email)
    end

    context "password confirmation" do
      it "is valid with an email, password and a same password_confirmation" do
        user = User.create(
          email: "hyd@123.com",
          password: "1234",
          password_confirmation: "1234")
      
        expect(user).to be_valid        
      end

      it "is invalid with an email, password and a different password_confirmation" do
        user = User.create(
          email: "hyd@123.com",
          password: "1234",
          password_confirmation: "1234567")
      
        expect(user).to_not be_valid        
      end
    end
  end

  describe "Class method test" do

    context "Test authenticate" do
      it "is valid when email and password is correct" do
        user = User.create(
          email: "h@123.com",
          password: "hahaha",
          password_confirmation: "hahaha")
        expect(User.authenticate("h@123.com", "hahaha")).to eq user
       end
      
      it "is invalid when email is correct and password is wrong" do
        user = User.create(
          email: "h@123.com",
          password: "hahaha",
          password_confirmation: "hahaha")
        expect(User.authenticate("h@123.com", "asdfasfd")).to_not eq user
       end
       
      it "is invalid when email does not exist" do
        user = User.create(
          email: "h@123.com",
          password: "hahaha",
          password_confirmation: "hahaha")
        expect(User.authenticate("h@23.com", "hahaha")).to_not eq user
       end

    end
  end

end
