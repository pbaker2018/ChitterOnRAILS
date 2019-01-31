require 'rails_helper'
require 'spec_helper'
require 'timecop'

RSpec.describe Peep do
  before do
    Timecop.freeze(Time.now)
  end

  subject { described_class.create(content: 'foo') }

  describe "Associations" do
    it "belongs to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe '#content' do
    it 'will display a user peep' do
      expect(subject.content).to eq 'foo'
    end
  end
end
