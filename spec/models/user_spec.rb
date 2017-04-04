require "rails_helper"

describe User do
  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end

end