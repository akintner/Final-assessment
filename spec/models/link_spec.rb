require "rails_helper"

RSpec.describe Link, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }

    it { should validate_uniqueness_of(:title).scoped_to(:user_id) }
    it { should validate_uniqueness_of(:url).scoped_to(:user_id) }
  end

  context "associations" do 
    it { is_expected.to belong_to(:user) }
  end
end