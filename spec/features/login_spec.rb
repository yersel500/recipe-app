require 'rails_helper'

RSpec.describe 'login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'has inputs and a submit button' do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  it 'returns error when inputs are empty' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'returns error when submit wrong input data' do
    fill_in 'Email', with: 'lalalalala@gmail.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'should redirect to root page when enters correct data' do
    fill_in 'Email', with: 'lilly@gmail.com'
    fill_in 'Password', with: 'lilly12345'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
    expect(page.current_path).to eql(root_path)
  end
end
