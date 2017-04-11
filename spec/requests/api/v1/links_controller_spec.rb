require 'rails_helper'

RSpec.describe Api::V1::LinksController do
  scenario "returns top ten links" do
    @user = User.create(email: "jediluke@starwars.com", password: "amazeballs")
    one = Link.create(title: "super neat", url: "http://www.neato.com", user_id: @user.id)
    two = Link.create(title: "wahoo", url: "http://www.google.com", user_id: @user.id)
    three = Link.create(title: "nice one", url: "http://www.chicken.com", user_id: @user.id)
    four = Link.create(title: "star trek is great", url: "http://www.dogs.com", user_id: @user.id)
    five = Link.create(title: "star wars is great", url: "http://www.elephants.com", user_id: @user.id)
    six = Link.create(title: "whoop", url: "http://www.whoop.com", user_id: @user.id)
    seven = Link.create(title: "penelope", url: "http://www.penelope.com", user_id: @user.id)
    eight = Link.create(title: "horses are great", url: "http://www.horses.com", user_id: @user.id)
    nine = Link.create(title: "save the whales", url: "http://www.whales.com", user_id: @user.id)
    ten = Link.create(title: "save the planet", url: "http://www.greenearth.com", user_id: @user.id)
    eleven = Link.create(title: "save the trees", url: "http://www.treesaregreat.com", user_id: @user.id)
    twelve = Link.create(title: "impeach trump", url: "http://www.loser.com", user_id: @user.id)

    get "/api/v1/links/toplinks"

    expect(response).to be_success
    links = JSON.parse(response.body)
    expect(links.count).to eq(10)
    expect(links.first).to be_a(Hash)
    expect(links.first["url"]).to eq(one.url)
  end
end