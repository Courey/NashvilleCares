feature "User navigates to specific service category page." do
  background do
    @category = Fabricate(:category, name: "Food")
  end

  scenario "user navigates to category with no services" do
    visit root_path
    click_on "Services"
    current_path.should == categories_path
    within("ul#categories") do
      click_on "Food"
    end
    current_path.should == category_path(@category)
  end

  scenario "user navigates to category with several services" do
    Fabricate(:service, name: "Food Bank A", category: @category)
    Fabricate(:service, name: "Food Bank B", category: @category)
    Fabricate(:service, name: "Food Bank C", category: @category)
    visit root_path
    click_on "Services"
    current_path.should == categories_path
    within("ul#categories") do
      click_on "Food"
    end
    current_path.should == category_path(@category)
    page.should have_content("Food Bank A")
    page.should have_content("Food Bank B")
    page.should have_content("Food Bank C")
  end
end
