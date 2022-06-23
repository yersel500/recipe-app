require 'rails_helper'

RSpec.describe 'FoodPage', type: :system do
  before :all do
    @user = User.create!(name: 'Babi',
                         email: 'b@g.com', password: '123456',
                         created_at: '2022-06-15 06:29:35.011315',
                         confirmed_at: '2022-06-15 18:08:24.835529')

    Food.create(id: 110, user: User.first, name: 'apple', measurement_unit: 'un', price: 1)
    Food.create(user: User.first, name: 'orange', measurement_unit: 'un', price: 2)
    Food.create(user: User.first, name: 'papaya', measurement_unit: 'un', price: 3)
    Food.create(user: User.first, name: 'banana', measurement_unit: 'un', price: 4)
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'Email', with: 'b@g.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      all('.nav-item')[2].click
    end

    it 'should contain "orange"' do
      expect(page).to have_content('orange')
    end

    it 'the foods items count should be #4' do
      count = all('.table-row').count
      expect(count).to eq 4
    end

    it 'should navigate to the food form page' do
      click_link 'New Food'
      expect(page).to have_current_path(new_user_food_path(user_id: @user.id))
    end
  end
end
