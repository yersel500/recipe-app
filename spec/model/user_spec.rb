require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(id: 11_111, name: 'Babi',
                         email: 'b@g.com', password: '123456',
                         created_at: '2022-06-15 06:29:35.011315',
                         confirmed_at: '2022-06-15 18:08:24.835529')
  end

  describe 'creates user' do
    it 'and returns the name of the user' do
      expect(@user.name).to eq('Babi')
    end
  end
end
