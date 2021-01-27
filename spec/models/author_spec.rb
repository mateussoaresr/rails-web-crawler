require "rails_helper"

RSpec.describe Author, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:quotes) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:author_about) }
  end
end
