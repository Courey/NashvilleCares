feature "User navigates to individual services show page." do
  background do
    @category = Fabricate(:category, name: "Food")
    @service = Fabricate(:service, name: "Mom's House", category: @category)
    @full_service = Fabricate(:service, name: "Food Bank A", category: @category, location: "331 Great Circle Rd. Nashville, TN", website: "www.foodplace.com", phone: "615-555-5555", description: "a place to get food stuff.", offered_services: "food for people that don't have any")
    Fabricate(:service, name: "Food Bank B", category: @category, location: "3605 Hilsboro Pike Nashville, TN", website: "www.foodplace.com", phone: "615-555-5555", description: "a place to get food stuff.", offered_services: "food for the poor")
    Fabricate(:service, name: "Food Bank C", category: @category, location: "37 Peabody St. Nashville, TN", website: "www.foodplace.com", phone: "615-555-5555", description: "a place to get food stuff.", offered_services: "canned food for low income population")
    visit root_path
  end

  scenario "User enters search term into search box and gets one relevant result" do
    within(".search") do
      fill_in "search", with: "people"
      click_on "Search"
    end
    page.should have_content("Food Bank A")
  end

  scenario "User enters search term into search box and gets several relevant results" do
    within(".search") do
      fill_in "search", with: "food"
      click_on "Search"
    end
    page.should have_content("Food Bank A")
    page.should have_content("Food Bank B")
    page.should have_content("Food Bank C")
  end
end
