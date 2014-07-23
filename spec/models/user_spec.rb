require "spec_helper"

describe User do

  describe 'something about factory' do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  describe "User model validations" do

    it "is invalid without an email" do
      expect(build(:user, email: nil)).to have(1).errors_on(:email)
    end

    it "is invalide when the email address is incorrect" do
      expect(build(:user, email: "asdf")).to have(1).errors_on(:email)
    end
    
    it "is invalid without a password" do
      expect(build(:user, password: nil)).to have(1).errors_on(:password)
    end

    it "is invalid without a password_confirmation" do
      expect(build(:user, password_confirmation: nil)).to have(1).errors_on(:password_confirmation)
    end

    it "is invalid when two users have the same email" do
      create(:user, email: "hyd@123.com")
      
      expect(build(:user, email: "hyd@123.com")).to have(1).errors_on(:email)
    end

    context "password confirmation" do
      it "is valid with an email, password and a same password_confirmation" do
        expect(build(:user)).to be_valid        
      end

      it "is invalid with an email, password and a different password_confirmation" do
        user = build(:user, 
          password: "1234",
          password_confirmation: "1234567")
      
        expect(user).to_not be_valid        
      end
    end
  end

  describe "Class method test" do

    before :each do
      @user = User.create(
          email: "h@123.com",
          password: "hahaha",
          password_confirmation: "hahaha")
    end
  
    context "Test authenticate" do
      it "is valid when email and password is correct" do
        expect(User.authenticate("h@123.com", "hahaha")).to eq @user
       end
      
      it "is invalid when email is correct and password is wrong" do
        expect(User.authenticate("h@123.com", "asdfasfd")).to_not eq @user
       end
       
      it "is invalid when email does not exist" do
        expect(User.authenticate("h@2xx3.com", "hahaha")).to_not eq @user
       end

    end
  end

end
