require 'pg'
feature 'Viewing the bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Bookmark-manager')
  end

  scenario 'display bookmarks list' do

    conn = PG.connect( dbname: 'bookmark_manager_test')

    conn.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks VALUES (2, 'http://www.destroyallsoftware.com');")
    conn.exec("INSERT INTO bookmarks VALUES (3, 'http://www.google.com');")

    visit('/bookmarks')
    # click_button 'View Bookmark List'
    expect(page).to have_content("http://www.makersacademy.com")
    expect(page).to have_content("http://www.destroyallsoftware.com")
    expect(page).to have_content("http://www.google.com")
  end
end
