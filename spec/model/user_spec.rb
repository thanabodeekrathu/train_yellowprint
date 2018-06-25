require 'rails_helper'

describe User do

  let(:user) { FactoryBot.create :user }

  it 'can crete' do
    expect{ user }.to change{ User.count }.from(0).to(1)
    # expect{ FactoryBot.create :user }.to change{ User.count }.by(1)
  end

  describe '#nickname' do
    user = FactoryBot.create :user, email: 'banana@banana.com'
    expect(user.nickname).to eq('banana')
  end

  describe 'created user' do
    before do 
      #create new user
      # FactoryBot.create :user
      user
    end

    it 'can delete' do
      #delete user
      expect{ user.destroy }.to change{ User.count }.by(-1)
    end

    it 'can update' do
      #edit user's email
      user.email = 'edited@email.com'
      user.save

      expect(user.reload.email).to eq('edited@email.com')
    end
  end
end
