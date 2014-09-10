feature "User navigates to services index page." do
  background do
    Fabricate(:category, name: "Food")
    Fabricate(:category, name: "Housing")
    Fabricate(:category, name: "Health")
    Fabricate(:category, name: "Job")
  end
  scenario "is displayed when loading the site" do
    visit root_path
    click_on "Services"
    current_path.should == categories_path
    within("ul#categories") do
      page.should have_content("Food")
      page.should have_content("Housing")
      page.should have_content("Health")
      page.should have_content("Job")
    end
  end
end
