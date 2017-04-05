require 'rails_helper'

describe "Editing Links" do
  context "A registered user" do
   scenario "can edit a link" do
      visit login_path
      click_button("Sign Up")

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      fill_in "link[title]", with: "You're a wizard, Harry!"
      fill_in "link[url]", with: "http://www.pottermore.com"
      click_button("Submit Link")

      expect(page).to have_content("http://www.pottermore.com")

      click_button("Edit")
      expect(current_path).to eq(edit_link_path('1'))

      fill_in "link[title]", with: "Turn to Page 394."
      click_button("Edit Link")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Turn to Page 394.")
    end
  end
end