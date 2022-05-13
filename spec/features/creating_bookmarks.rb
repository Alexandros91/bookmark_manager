require 'pg'

feature 'Add bookmark' do
  scenario 'displays a page where you can add a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    full_in('title' with: 'Google')
    click_button('Submit')

    expect(page).to have_link('Google', 'http://www.google.com')
  end
end
