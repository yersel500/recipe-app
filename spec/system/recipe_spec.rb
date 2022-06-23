require 'rails_helper'

RSpec.describe 'RecipePage', type: :system do
  before :all do
    @user = User.create!(name: 'Babi',
                         email: 'b@g.com', password: '123456',
                         created_at: '2022-06-15 06:29:35.011315',
                         confirmed_at: '2022-06-15 18:08:24.835529')

    @r1 = Recipe.create(id: 111, user_id: @user.id, name: 'Chicken Fried', preparation_time: 1, cooking_time: 2,
                        public: false)
    @r2 = Recipe.create(user_id: @user.id, name: 'Special Food', preparation_time: 2, cooking_time: 0.25, public: false)
    @r3 = Recipe.create(user_id: @user.id, name: 'Pizza', preparation_time: 1, cooking_time: 1.5, public: false)
    @r4 = Recipe.create(user_id: @user.id, name: 'New Recipe', preparation_time: 3, cooking_time: 0.5, public: false)
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'Email', with: 'b@g.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      all('.nav-item')[3].click
    end

    it 'should contain "Chicken Fried"' do
      expect(page).to have_content('Chicken Fried')
    end

    it 'the recipe items count should be #4' do
      count = all('.recipe-card').count
      expect(count).to eq 4
    end

    it 'shoudl navigate to the recipe form page' do
      click_link 'Create New Recipe'
      expect(page).to have_current_path(new_user_recipe_path(user_id: @user.id))
    end
  end
end
