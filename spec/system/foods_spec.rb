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

    # @r1 = Recipe.create(id: 111, user_id: @user.id, name: 'Chicken Fried', preparation_time: 1, cooking_time: 2,
    #                     public: false)
    # @r2 = Recipe.create(user_id: @user.id, name: 'Special Food', preparation_time: 2, cooking_time: 0.25, public: false)
    # @r3 = Recipe.create(user_id: @user.id, name: 'Pizza', preparation_time: 1, cooking_time: 1.5, public: false)
    # @r4 = Recipe.create(user_id: @user.id, name: 'New Recipe', preparation_time: 3, cooking_time: 0.5, public: false)
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
