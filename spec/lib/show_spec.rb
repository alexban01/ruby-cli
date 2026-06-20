require './lib/show'
require 'pry'

RSpec.describe 'Show' do
  describe '#show' do
    subject(':show') { Show.new.show(args) }
    let(:args) { 'rails_event_store-rspec' }

    context "when gem exists" do
      it { is_expected.to eq(0) }

      it 'outputs gem info' do
        expect{subject}.to output(/--------Name: rails_event_store-rspec --------
Version: 2.0.1
Authors: Arkency
Info: RSpec matchers for RailsEventStore
Homepage: https:\/\/railseventstore.org\/
Downloads: 770514
---------------------------------------
/).to_stdout
      end
    end
  end
end
