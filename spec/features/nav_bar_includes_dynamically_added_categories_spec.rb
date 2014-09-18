feature "nav bar includes dynamically created dropdown list of categories" do
  background do
    Fabricate(:category, name: "Food")
    Fabricate(:category, name: "Housing")
    Fabricate(:category, name: "Health")
    Fabricate(:category, name: "Job")
  end

  scenario "nav ul contains dynamically created categories" do
    visit root_path
    within("ul.right") do
      page.should have_content("Food")
    end
  end

end
