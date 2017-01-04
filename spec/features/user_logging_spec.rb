require 'rails_helper'

feature 'user logging' do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit root_path
    within('.welcome-div') do
      click_on 'Log In'
    end
  end

  scenario 'successful' do
    fill_in :login_email, with: user.email
    fill_in :login_password, with: user.password

    within('.simple_form') do
      click_on 'Log In'
    end

    expect(page).to have_content("Hello, #{user.name}")
  end

  context 'unsuccessful' do
    scenario 'with wrong email' do
      fill_in :login_email, with: 'wrong'
      fill_in :login_password, with: user.password

      within('.simple_form') do
        click_on 'Log In'
      end

      expect(page).to have_content('Invalid email/password combination')
    end

    scenario 'with wrong password' do
      fill_in :login_email, with: user.email
      fill_in :login_password, with: 'nottheone'

      within('.simple_form') do
        click_on 'Log In'
      end

      expect(page).to have_content('Invalid email/password combination')
    end
  end
end
