require 'bookmark'

describe Bookmark do
  describe '.see' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com/', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com/', 'Destroy All Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com/', 'Google');")

      bookmarks = Bookmark.see

      expect(bookmarks).to include({"Makers Academy" => "http://www.makersacademy.com/"})
      expect(bookmarks).to include({"Destroy All Software" => "http://www.destroyallsoftware.com/"})
      expect(bookmarks).to include({"Google" => "http://www.google.com/"})
     
    end
  end
end 