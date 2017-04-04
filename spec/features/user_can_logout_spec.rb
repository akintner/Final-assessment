require 'rails_helper'

describe "Logout workflow" do
  context "A registered user" do
   scenario "can login and see logout button" do
      visit login_path
      click_button("Sign Up")
      expect(current_path).to eq(users_new_path)

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Logout")
    end

    scenario "can logout successfully" do
      visit login_path
      click_button("Sign Up")
      expect(current_path).to eq(users_new_path)

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Logout")

      click_on("Logout")
      expect(current_path).to eq(login_path)
    end
  end
end