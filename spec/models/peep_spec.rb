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

  # describe '#name' do
  #   it 'will display the user name' do
  #     expect(peep.name).to eq 'Viv'
  #   end
  # end

  # describe '#created_at' do
  #   it 'will display the time the peep was created' do
  #     expect(subject.created_at).to eq Time.now
  #   end
  # end
  #
  # describe '#updated_at' do
  #   it 'will display the time the peep was updated' do
  #     expect(subject.updated_at).to eq Time.now
  #   end
  # end
end
