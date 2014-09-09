require 'rails_helper'

feature "admin logs into activeadmin" do
  background do
    Fabricate(:admin, email: "admin@example.com", password: "password")
  end
  scenario "admin can log in" do
    visit new_admin_session_path
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_button "Login"
    current_path.should eq admin_root_path
  end
end
