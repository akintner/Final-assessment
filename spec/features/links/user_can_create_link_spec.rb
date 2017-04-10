require 'rails_helper'

describe "Link Creation" do
  context "A registered user" do
   scenario "can create a link" do
      visit login_path
      click_button("Sign Up")

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      fill_in "link-title", with: "You're a wizard, Harry!"
      fill_in "link-url", with: "http://www.pottermore.com"
      click_button("Submit Link")

      expect(page).to have_content("http://www.pottermore.com")
      expect(current_path).to eq(root_path)
    end

    scenario "cannot create a link with an invalid URL" do
      visit login_path
      click_button("Sign Up")

      fill_in "user[email]", with: "Goodness@goodness.com"
      fill_in "user[password]", with: 'boomtown'
      fill_in "user[password_confirmation]", with: 'boomtown'
      click_button("Sign Up")

      fill_in "link-title", with: "whoa, super neat"
      fill_in "link-url", with: "boom.com"

      expect(page).not_to have_content("whoa, super neat")
      expect(page).not_to have_content("boom.com")
    end
  end
end