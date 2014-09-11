require 'rails_helper'

feature "admin adds service via activeadmin" do
  background do
    Fabricate(:admin, email: "admin@example.com", password: "password")
    @category = Fabricate(:category, name: "Food")
    visit new_admin_session_path
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  scenario "admin can add service via activeadmin" do
    current_path.should eq admin_root_path
    click_link "Services"
    current_path.should eq admin_services_path
    click_link "New Service"
    select "Food", :from => "service[category_id]"
    fill_in "Name", with: "Test Service"
    fill_in "Location", with: "123 Main St. Somewhere, MI 11111"
    fill_in "Website", with: "www.test.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Description", with: "This is a test. This is only a test."
    fill_in "Offered services", with: "some service stuffs"
    click_button "Create Service"
    page.should have_content("Test Service")
    page.should have_content("Service was successfully created.")
    within(".attributes_table") do
      page.should have_content("Test Service")
      page.should have_content("123 Main St. Somewhere, MI 11111")
      page.should have_content("www.test.com")
      page.should have_content("123-456-7890")
      page.should have_content("This is a test. This is only a test.")
      page.should have_content("some service stuffs")
      page.should have_content("Food")
    end
  end

  scenario "admin can NOT add service without selecting a category" do
    current_path.should eq admin_root_path
    click_link "Services"
    current_path.should eq admin_services_path
    click_link "New Service"
    fill_in "Name", with: "Test Service"
    fill_in "Location", with: "123 Main St. Somewhere, MI 11111"
    fill_in "Website", with: "www.test.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Description", with: "This is a test. This is only a test."
    fill_in "Offered services", with: "some service stuffs"
    click_button "Create Service"
    page.should have_content("can't be blank")
    page.should_not have_content("Service was successfully created.")
  end

  scenario "admin can NOT add service without a name" do
    current_path.should eq admin_root_path
    click_link "Services"
    current_path.should eq admin_services_path
    click_link "New Service"
    select "Food", :from => "service[category_id]"
    fill_in "Location", with: "123 Main St. Somewhere, MI 11111"
    fill_in "Website", with: "www.test.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Description", with: "This is a test. This is only a test."
    fill_in "Offered services", with: "some service stuffs"
    click_button "Create Service"
    page.should have_content("can't be blank")
    page.should_not have_content("Service was successfully created.")
  end
end
