#!/usr/bin/ruby
require 'pg'

class Bookmark
  def self.see
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
      
    rs = con.exec "SELECT * FROM bookmarks;"

      rs.map do |bookmark| #bookmark = {"id"=>"1", "url"=>"http://makers.tech"}
        { bookmark['title'] => bookmark['url'] }
      end
  end
end 
