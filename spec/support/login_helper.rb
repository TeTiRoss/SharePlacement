module LoginHelper
  def login_user
    @user = FactoryGirl.create(:user)
    visit '/login'

    fill_in :login_email, with: @user.email
    fill_in :login_password, with: @user.password

    within('.simple_form') do
      click_on 'Log In'
    end
  end

  def logout_user
    click_on 'Log Out'
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
