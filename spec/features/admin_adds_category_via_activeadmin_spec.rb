require 'rails_helper'

feature "admin adds category via activeadmin" do
  background do
    Fabricate(:admin, email: "admin@example.com", password: "password")
    visit new_admin_session_path
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  scenario "admin can add category via activeadmin" do
    current_path.should eq admin_root_path
    click_link "Categories"
    current_path.should eq admin_categories_path
    click_link "New Category"
    fill_in "Name", with: "Test Category"
    click_button "Create Category"
    page.should have_content("Test Category")
    page.should have_content("Category was successfully created.")
  end

  scenario "admin can NOT add category with no name" do
    current_path.should eq admin_root_path
    click_link "Categories"
    current_path.should eq admin_categories_path
    click_link "New Category"
    click_button "Create Category"
    page.should_not have_content("Category was successfully created.")
    page.should have_content("can't be blank")
  end
end
