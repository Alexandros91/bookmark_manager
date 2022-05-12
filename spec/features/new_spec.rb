require 'pg'

feature 'Add bookmark' do
  scenario 'displays a page where you can add a bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://example.org')
    click_button('Submit')

    expect(page).to have_content 'http://example.org'
  end
end
