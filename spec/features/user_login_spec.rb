require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'test',
      last_name: 'test',
      email: 'test@test.com',
      password: '1234')
  end

  scenario 'visit login page and login with correct info' do
    visit login_path

    
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '1234'
    click_on 'Submit'
    
    within('nav') { expect(page).to have_content('test@test.com') }
    save_screenshot('post_login.png')
  end

end
