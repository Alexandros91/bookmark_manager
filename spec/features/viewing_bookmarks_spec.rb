require 'pg'

feature 'Viewing bookmarks' do
  scenario 'it displays the bookmark URLs' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers Academy', 'http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Destroy All Software', 'http://www.destroyallsoftware.com/');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com/');")

    visit('/bookmarks')
    
    # save_and_open_page

    # expect(page).to have_content "www.google.com/"
    expect(page).to have_content "www.makersacademy.com/"
    expect(page).to have_content "http://www.destroyallsoftware.com/"
    expect(page).to have_content "Google"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Makers Academy"
  end

end

