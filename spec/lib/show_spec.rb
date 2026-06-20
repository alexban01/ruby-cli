require './lib/show'
require 'pry'

RSpec.describe 'Show' do
  describe '#execute' do
    subject(':show') { Show.new(printer).execute(args) }

    let(:printer) { StringIO.new }
    let(:args) { 'rails_event_store-rspec' }

    context "when gem exists" do
      it { is_expected.to eq(0) }

      it 'outputs gem info' do
        subject

        printer.rewind

        expect(printer.read).to eq("--------Name: rails_event_store-rspec --------
Version: 2.0.1
Authors: Arkency
Info: RSpec matchers for RailsEventStore
Homepage: https://railseventstore.org/
Downloads: 770515
---------------------------------------

")
      end
    end
  end
end
