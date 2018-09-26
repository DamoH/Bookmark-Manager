require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
    bookmarks = conn.exec("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark| bookmark['url'] }
  end

end
