# require 'rails_helper'

# RSpec.describe 'LoginPage', type: :system do
#   before :all do
#     @user1 = User.create!(id: 1, name: 'Babi',
#                           email: 'b@g.com', password: '123456',
#                           created_at: '2022-06-15 06:29:35.011315',
#                           confirmed_at: '2022-06-15 18:08:24.835529')

#     @user2 = User.create!(id: 2, name: 'Jhon',
#                           email: 'a@g.com', password: '123456',
#                           created_at: '2022-06-15 06:29:35.011315',
#                           confirmed_at: '2022-06-15 18:08:24.835529')

#     @user3 = User.create!(id: 3, name: 'Alemayehu',
#                           email: 'al@g.com', password: '123456',
#                           created_at: '2022-06-15 06:29:35.011315',
#                           confirmed_at: '2022-06-15 18:08:24.835529')
#   end

#   after :all do
#     User.all.destroy_all
#     @user1.destroy
#     @user2.destroy
#     @user3.destroy
#   end

#   context 'testing' do
#     before :each do
#       visit root_path
#     end

#     it 'username should render correctly' do
#       expect(page).to have_content 'Log in'
#     end

#     it 'shows a detailed error when I click the submit button without
#         filling in the username and the password' do
#       click_button 'Log in'
#       expect(page).to have_content('Invalid Email or password.')
#     end

#     it 'shows a detailed error when I click the submit button after
#         filling in the username and the password with incorrect data' do
#       visit root_path
#       fill_in 'Email', with: 'asdf'
#       fill_in 'Password', with: 'asdf'
#       click_button 'Log in'
#       expect(page).to have_content('You need to sign in or sign up before continuing.')
#     end

#     it 'Redirects me to the root page when I click the submit button after
#           filling in the username and the password with correct data,
#               I am redirected to the root page' do
#       fill_in 'Email', with: 'b@g.com'
#       fill_in 'Password', with: '123456'
#       click_button 'Log in'
#       expect(page).to have_current_path('/')
#     end
#   end
# end
