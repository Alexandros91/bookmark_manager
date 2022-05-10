#!/usr/bin/ruby
require 'pg'

class Bookmark
  def self.see
      con = PG.connect :dbname => 'bookmark-manager'

      rs = con.exec "SELECT * FROM bookmarks;"

      rs.map do |bookmark| #bookmark = {"id"=>"1", "url"=>"http://makers.tech"}
        bookmark['url']
      end
  end
end 