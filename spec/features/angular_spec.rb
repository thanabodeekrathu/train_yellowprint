require 'rails_helper'

describe 'angular', js: true do
  let(:normal_user) { create_normal_user }
  let(:super_admin) { create_super_admin }

  before do
    sign_in normal_user
  end

  it 'works!' do
    ss('thanabodeekrathu')
    expect(page).to have_content 'Greeting!'
  end

  it 'open first page' do
    expect(page).to have_content "Hello #{normal_user.email}"
  end

  it 'can go to second page' do
    click_link 'Second'
    expect(page).to have_content 'Seccond page'
  end

  #Homework Rails test
  it 'can go to third page' do
    click_link 'Third'
    expect(page).to have_content 'Third page'
  end

  #Train Rails test
  it 'can reset password' do
    sign_out

    visit '/users/password/new'

    fill_in 'Email', with: normal_user.email
    expect(normal_user.reload.reset_password_token).to be_nil
    click_button('Send me reset password instructions')
    sleep 1

    expect(normal_user.reload.reset_password_token).to_not be_nil
  end
end
