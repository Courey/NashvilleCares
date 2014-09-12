require 'rails_helper'

feature "geocode automatically generates latitude and longitude upon creation of service" do
  background do
    Fabricate(:admin, email: "admin@example.com", password: "password")
    @category = Fabricate(:category, name: "Food")
    visit new_admin_session_path
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
    click_link "Services"
    click_link "New Service"
  end

  scenario "latitude and longitude are visible upon creation" do
    select "Food", :from => "service[category_id]"
    fill_in "Name", with: "Test Service"
    fill_in "Location", with: "301 6th Ave N Nashville, TN"
    fill_in "Website", with: "www.test.com"
    fill_in "Phone", with: "123-456-7890"
    fill_in "Description", with: "This is a test. This is only a test."
    fill_in "Offered services", with: "some service stuffs"
    click_button "Create Service"
    page.should have_content("Test Service")
    page.should have_content("Service was successfully created.")
    within(".attributes_table") do
      page.should have_content("36.1640875")
      page.should have_content("-86.7836513")
    end
  end
end
