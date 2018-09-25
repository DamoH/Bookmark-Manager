feature 'Viewing the bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Bookmark-manager')
  end

  scenario 'display bookmarks list' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    # click_button 'View Bookmark List'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
