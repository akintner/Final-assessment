require 'rails_helper'

describe "Guest login workflow" do
  context "An unregisted guest" do
   scenario "can visit the app home page" do
      visit root_path

      expect(current_path).to eq('/login')
      expect(page).to have_button("Sign Up")
      expect(page).to have_button("Log In")
    end

   scenario "can create a new registration for the app" do
      visit login_path
      click_button("Sign Up")
      expect(current_path).to eq(users_new_path)

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      expect(current_path).to eq(root_path)
    end

    scenario "cannot log in to the app with blank credentials" do
      visit login_path
      click_on "Log In"

      expect(page).to have_content("Name and password combination not found, please try again")
    end

    scenario "cannot create a new registration if the password and password confirmation do not match" do
      visit login_path
      click_button("Sign Up")
      expect(current_path).to eq(users_new_path)

      fill_in "user[email]", with: "headmasterdumbledore@wizard.com"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'imawizard'
      click_button("Sign Up")

      expect(page).to have_content("Password and password confirmation do not match. Please try again.")
    end

    scenario "can log in" do
      visit login_path

      fill_in "email", with: "profsnape@hogwarts.edu"
      fill_in "password", with: 'password01'
      fill_in "password_confirmation", with: 'password01'
      click_button("Log In")

      expect(current_path).to eql(root_path)
      expect(page).to have_content("Successfully logged in")
    end

    scenario "cannot log in if they enter invalid credentials" do
      visit login_path

      fill_in "email", with: "profsnape@hogwarts.edu"
      fill_in "password", with: 'password01'
      click_button("Log In")

      expect(current_path).to eql(login_path)
    end
  end
end