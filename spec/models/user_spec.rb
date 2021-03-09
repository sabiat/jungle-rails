require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it 'should save successfully' do
      @user = User.new(first_name: 'test', last_name: 'test', email:'test@test.com', password: '1234', password_confirmation: '1234')
      @user.save!
      expect(@user.created_at).to be_present
    end

    it 'should validate presence of password' do
      @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: nil, password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save if password does not match password confirmation' do
      @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '1234', password_confirmation: '12345')

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should require password of a minimum length of 4 characters' do
      @user = User.create(first_name: 'test', last_name: 'test', email: 'test@test.com', password: '12', password_confirmation: '12')
      expect(@user.errors.full_messages[0]).to include("Password is too short")
    end

    it 'should validate presence of first name' do
      @user = User.create(first_name: nil, last_name: 'Bob', email: 'bob@bob.com', password: '1234', password_confirmation: '1234')

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should validate presence of last name' do
      @user = User.create(first_name: 'Bob', last_name: nil, email: 'bob@bob.com', password: '1234', password_confirmation: '1234')

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'should validate presence of email' do
      @user = User.create(first_name: 'Bob', last_name: 'Smith', email: nil, password: '1234', password_confirmation: '1234')

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should only accept unique emails' do
      @user1 = User.create(first_name: 'Bob', last_name: 'Smith', email: 'test@test.com', password: '1234', password_confirmation: '1234')

      @user2 = User.create(first_name: 'Bob2', last_name: 'Smith2', email: 'test@test.com', password: '1234', password_confirmation: '1234')

      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end

    it 'unique emails should not be case sensitive' do
      @user1 = User.create(first_name: 'Bob', last_name: 'Smith', email: 'test@test.com', password: '1234', password_confirmation: '1234')

      @user2 = User.create(first_name: 'Bob2', last_name: 'Smith2', email: 'TEST@TEST.com', password: '1234', password_confirmation: '1234')

      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
  
  describe '.authenticate_with_credentials' do

    it 'should return user when given correct credentials' do
      @user = User.create(first_name: 'Sam', last_name: 'Bill', email: 'example@example.com', password: '1234', password_confirmation: '1234')

      expect(User.authenticate_with_credentials('example@example.com', '1234')).to eq(@user)
    end

    it 'should return nil when given incorrect credentials' do
      @user = User.create(first_name: 'Sam', last_name: 'Bill', email: 'example@example.com', password: '1234', password_confirmation: '1234')

      expect(User.authenticate_with_credentials('example@example.com', '1')).to eq(nil)
    end

    it 'should return user when given correct email with trailing spaces' do
      @user = User.create(first_name: 'Sam', last_name: 'Bill', email: 'example@example.com', password: '1234', password_confirmation: '1234')

      expect(User.authenticate_with_credentials('    example@example.com   ', '1234')).to eq(@user)
    end

    it 'should return user with correct credentials, ignoring case' do
      @user = User.create(first_name: 'Sam', last_name: 'Bill', email: 'eXample@domain.COM', password: '1234', password_confirmation: '1234')

      expect(User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', '1234')).to eq(@user)
    end


  end

  end
end
