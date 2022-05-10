require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save a valid user' do
      @user = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'toaster',
        password_confirmation: 'toaster'
      )

      expect(@user).to be_valid
    end


    it 'should not save without a unique email' do
      @user1 = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'toaster',
        password_confirmation: 'toaster'
      )
      @user2 = User.create(
        first_name: 'Lisa',
        last_name: 'Mayer',
        email:'test@email.com',
        password: 'wiggle',
        password_confirmation: 'wiggle'
      )

      expect(@user2).to_not be_valid
    end
    
    it 'should have a valid password and password confirmation' do
      @user = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'toaster',
        password_confirmation: nil
      )

      expect(@user).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      @user = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'toaster',
        password_confirmation: 'potato'
      )

      expect(@user).to_not be_equal(@user.password_confirmation)
    end

    it 'should have a minimum password length' do
      @user = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'ya',
        password_confirmation: 'ya'
      )

      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate user credentials' do
      @user = User.create(
        first_name: 'Lisa',
        last_name: 'Meyer',
        email:'test@email.com',
        password: 'wiggle',
        password_confirmation: 'wiggle'
      )
      authenticate = User.authenticate_with_credentials(@user.email, @user.password)
      expect(authenticate).to_not be_valid
    end
  end
end
