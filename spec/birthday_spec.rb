feature 'Testing, testing' do
  scenario 'page works' do
    visit('/')
    expect(page).to have_content 'Hello how you doin'
  end
end
