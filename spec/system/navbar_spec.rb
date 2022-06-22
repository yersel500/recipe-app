require 'rails_helper'

RSpec.describe 'Navigation', type: :system do
  before :all do
    @user1 = User.create!(id: 1, name: 'Babi',
                          email: 'b@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315',
                          confirmed_at: '2022-06-15 18:08:24.835529')
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'Email', with: 'b@g.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'username should render correctly' do
      expect(page).to have_content @user1.name
    end

    it 'when foods nav item is clicked shood take us foods page' do
      all('.nav-item')[2].click
      expect(page).to have_current_path(user_foods_path(user_id: @user1.id))
    end

    it 'when foods nav item is clicked shood take us recipes page' do
      all('.nav-item')[3].click
      expect(page).to have_current_path(user_recipes_path(user_id: @user1.id))
    end

    it 'when logout button clicked should take us to signin page' do
      all('.navbar .btn-solid').first.click
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'when home nav item clicked should take us root page' do
      all('.nav-item')[0].click
      expect(page).to have_current_path('/public_list')
    end

    it 'when home navbar brand clicked should take us root page' do
      all('.navbar-brand').first.click
      expect(page).to have_current_path('/public_list')
    end
  end
end
