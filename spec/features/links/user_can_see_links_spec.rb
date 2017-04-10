require 'rails_helper'

describe "Root Page/Links#index" do
  context "A registered user" do
   scenario "can login and see links" do
      visit login_path
      click_button("Sign Up")

      fill_in "user[email]", with: "profsnape@hogwarts.edu"
      fill_in "user[password]", with: 'password01'
      fill_in "user[password_confirmation]", with: 'password01'
      click_button("Sign Up")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Filter by letters in the URL or title")
    end
  end
end