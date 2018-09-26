require 'pg'
def setup_test_database
  p 'Setting up the test databse...'
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec("TRUNCATE bookmarks;")
end
