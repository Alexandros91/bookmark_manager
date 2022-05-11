require 'pg'

feature 'Add bookmark' do
  scenario 'displays a page where you can add a bookmark' do
    visit('/add_bookmark')
    expect(page).to have_field('url')
    expect(page).to have_field('title')
  end
end
