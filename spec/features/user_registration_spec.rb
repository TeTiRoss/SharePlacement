require 'rails_helper'

feature 'user registration' do
  before(:each) do
    visit root_path
    click_on 'Register'
  end

  scenario 'successful' do
    fill_in :user_name, with: 'Ann'
    fill_in :user_email, with: 'ann@mail.com'
    fill_in :user_password, with: '11111111'
    fill_in :user_password_confirmation, with: '11111111'

    click_on 'Sign Up'

    expect(page).to have_content('Welcome, Ann.')
  end

  context 'unsuccessful' do
    scenario 'with required attributes missing' do
      click_on 'Sign Up'

      within('.user_name') do
        expect(page).to have_content("can't be blank")
      end
      within('.user_email') do
        expect(page).to have_content("can't be blank")
      end
      within('.user_password') do
        expect(page).to have_content("can't be blank")
      end
    end

    scenario 'with passwords mismatch' do
      fill_in :user_password, with: '11111111'
      fill_in :user_password_confirmation, with: '22222222'

      click_on 'Sign Up'

      within('.user_password_confirmation') do
        expect(page).to have_content("doesn't match Password")
      end
    end

    scenario 'with too short password' do
      fill_in :user_password, with: '1234'

      click_on 'Sign Up'

      within('.user_password') do
        expect(page).to have_content('is too short (minimum is 8 characters)')
      end
    end
  end
end
