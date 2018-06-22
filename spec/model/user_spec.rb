require 'rails_helper'

describe User do
  # before :all do #do after "it" test one time
  #   puts 'all'
  # end

  # before :each do #do before each "it" test
  #   puts 'before each'
  # end

  # after :each do #do after each "it" test
  #   puts 'after each'
  # end

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
      
      # expect do 
      #   User.last.destroy 
      # end.to change{ User.count }.by(-1)
    end

    it 'can update' do
      #edit user's email
      user.email = 'edited@email.com'
      user.save

      expect(user.reload.email).to eq('edited@email.com')
    end
  end
end
