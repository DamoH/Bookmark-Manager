feature 'Viewing the bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content('Bookmark-manager')
  end

  scenario 'display bookmarks list' do
    visit('/')
    click_button 'View Bookmark List'
    expect(page).to have_content('List of Bookmarks')
  end
end