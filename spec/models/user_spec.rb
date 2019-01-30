require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { described_class.new(password: "password", email: "test@example.com", user_name: "Name") }

  describe "Associations" do
    it "has many peeps" do
      assc = described_class.reflect_on_association(:peeps)
      expect(assc.macro).to eq :has_many
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a username" do
      subject.user_name = nil
      expect(subject).to_not be_valid
    end
  end
end
