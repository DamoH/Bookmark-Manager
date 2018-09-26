require 'pg'
feature 'Viewing the bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Bookmark-manager')
  end

  scenario 'display bookmarks list' do

    conn = PG.connect( dbname: 'bookmark_manager_test')
    p "**********"
    p conn
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')")
      
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com')")
    p conn
    p "I am here"
    visit('/bookmarks')
    # click_button 'View Bookmark List'
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end
end
