require "rails_helper"

RSpec.describe Quote, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:tags) }
    it { is_expected.to belong_to(:author) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
