require 'bookmark'

describe Bookmark do
  describe '.see' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.see

      expect(bookmarks).to include("http://www.google.com/")
      expect(bookmarks).to include("http://www.makersacademy.com/")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end
end 