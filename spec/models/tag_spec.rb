require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:quote) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
