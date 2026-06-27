require './lib/search'

RSpec.describe 'Search' do
  describe '#execute' do
    subject(:search) { Search.new(printer).execute(args) }

    let(:printer) { StringIO.new }
    let(:args) { 'rails' }

    context "when the gem exists" do
      it { is_expected.to eq(0) }

      it 'outputs the gem info' do
        subject

        printer.rewind

        expect(printer.read).to include('Name: rails')
      end
    end
  end
end
