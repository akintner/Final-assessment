require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  xscenario "Mark a link as read" do
    visit login_path
    click_button("Sign Up")

    fill_in "user[email]", with: "profsnape@hogwarts.edu"
    fill_in "user[password]", with: 'password01'
    fill_in "user[password_confirmation]", with: 'password01'
    click_button("Sign Up")

    fill_in "link-title", with: "You're a wizard, Harry!"
    fill_in "link-url", with: "http://www.pottermore.com"
    click_button("Submit Link")

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_content('Mark as unread')
      expect(page).not_to have_content('Mark as read')
      expect(Link.first.read).to be_truthy
    end

  end
end
