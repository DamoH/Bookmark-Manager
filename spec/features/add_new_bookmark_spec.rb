
feature 'Adding new bookmarks' do
  scenario 'add new bookmark into list' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.dummywebsite.com')
    click_button('Submit')
    expect(page).to have_content('http://www.dummywebsite.com')
  end
end
