require './lib/show'
require 'pry'

RSpec.describe 'Show' do
  describe '#show' do
    subject(':show') { Show.new.show(args) }
    let(:args) { 'rails_event_store-rspec' }

    it 'return exit code 0' do
      expect(subject).to eq(0)
    end

    it 'output name is correct' do
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
