feature "User navigates to individual services show page." do
  background do
    @category = Fabricate(:category, name: "Food")
    @service = Fabricate(:service, name: "Mom's House", category: @category)
    @full_service = Fabricate(:service, name: "Food Place", category: @category, location: "123 Main St. Nashville, TN 37205", website: "www.foodplace.com", phone: "615-555-5555", description: "a place to get food stuff.", offered_services: "food for people that don't have any")
    visit root_path
    click_on "Services"
    within("ul#categories") do
      click_on "Food"
    end
  end

  scenario "User views individual service page containing only a service name" do
    current_path.should == category_path(@category)
    click_on "Mom's House"
    current_path.should == service_path(@service)
    within("h1#service_name") do
      page.should have_content("Mom's House")
    end
  end

  scenario "User views service show page with all fields" do
    current_path.should == category_path(@category)
    click_on "Food Place"
    current_path.should == service_path(@full_service)
    within("#service") do
      page.should have_content("Food Place")
      page.should have_content("123 Main St. Nashville, TN 37205")
      page.should have_content("www.foodplace.com")
      page.should have_content("615-555-5555")
      page.should have_content("a place to get food stuff.")
      page.should have_content("food for people that don't have any")
    end
  end
end
