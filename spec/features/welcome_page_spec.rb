feature "Welcome Page" do
  scenario "is displayed when loading the site" do
    visit root_path
    expect(page).to have_content("Support Nashville is a community maintained database of social programs for low income residents of Nashville and surrounding areas.")
  end
  scenario "nav bar contents" do
    visit root_path
    expect(page).to have_link("Support Nashville")
    expect(page).to have_link("Services")
    expect(page).to have_button("Search")
    expect(page).to have_link("About")
  end
end
