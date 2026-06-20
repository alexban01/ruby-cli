require './lib/search'
require 'pry'

RSpec.describe 'Search' do
  describe '#search' do
    subject(':search') { Search.new.search(args) }
    let(:args) { 'rails_event_store-rspec' }

    context 'search with non-existent gem' do
      let(:args) { '91237491237374123' }
      it 'return message with 0 gems' do
        expect(subject.gems).to eq([])
      end

      it 'return message when no results found' do
        expect(subject.exit_code).to eq(1)
      end
    end

    it 'data is returned correctly for one specfic gem' do
      for gem in subject.gems do
        # binding.pry
        expect(gem['name']).to match('rails_event_store-rspec')
        expect(gem['authors']).to match('Arkency')
        expect(gem['homepage_uri']).to match('https://railseventstore.org/')
      end
    end

    it 'multiple gems can be returned' do
      expect(subject.gems).not_to be []
    end

    it 'return exit code 0' do
      expect(subject.exit_code).to eq(0)
    end
  end
end