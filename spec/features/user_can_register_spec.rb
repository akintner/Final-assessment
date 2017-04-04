require 'rails_helper'

describe "Guest login workflow" do
  context "An unregisted guest" do
   scenario "can visit the app home page" do
      visit login_path

      expect(current_path).to eq('/login')
      expect(page).to have_button("Sign Up or Log In")
    end

   scenario "can create a new registration for the app" do
      visit login_path

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up or Log In")

      expect(current_path).to eq(root_path)
    end

    scenario "cannot create a new registration for the app with blank credentials" do
      visit login_path
      click_on "Sign Up or Log In"

      expect(page).to have_content("Email and password combination does not exist")
    end

    scenario "cannot create a new registration if the password and password confirmation do not match" do
      visit login_path

      fill_in "user[email]", with: "headmasterdumbledore@wizard.com"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'imawizard'
      click_button("Sign Up or Log In")

      expect(page).to have_content("Password and password confirmation do not match. Please try again.")
    end

    # scenario "can log in" do
    #   user = create(:registered_user)
    #   email = user.email

    #   visit login_path
    #   fill_in "email", with: "#{email}"
    #   fill_in "password", with: "password"
    #   click_on "Sign Up or Log In"

    #   expect(current_path).to eql(root_path)
    #   expect(page).to have_content("Successfully logged in")
    # end

    # scenario "cannot log in if they enter invalid credentials" do
    #   user = create(:registered_user)
    #   email = user.email

    #   visit login_path
    #   fill_in "email", with: "#{email}"
    #   fill_in "password", with: "wrong"
    #   click_on "Sign Up or Log In"

    #   expect(current_path).to eql(login_path)
    #   expect(page).to have_content("Email and password combination does not exist")
    # end
  end
end