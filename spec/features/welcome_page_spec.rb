feature "Welcome Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Support Nashville is a community maintained database of social programs for low income residents of Nashville and surrounding areas.")
  end
end
