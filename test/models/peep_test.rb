# frozen_string_literal: true

require 'test_helper'

class PeepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  require 'peep'
  require 'timecop'

  RSpec.describe Peep do
    before do
      Timecop.freeze(Time.now)
    end

    subject (:peep) { described_class.create(content: 'foo', name: 'Viv') }

    describe '#content' do
      it 'will display a user peep' do
        expect(peep.content).to eq 'foo'
      end
    end

    describe '#name' do
      it 'will display the user name' do
        expect(peep.name).to eq 'Viv'
      end
    end

    describe '#created_at' do
      it 'will display the time the peep was created' do
        expect(peep.created_at).to eq Time.now
      end
    end

    describe '#updated_at' do
      it 'will display the time the peep was updated' do
        expect(peep.updated_at).to eq Time.now
      end
    end
  end
end
