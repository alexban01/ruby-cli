require './lib/search'
require 'pry'

RSpec.describe 'Search' do
  describe '#search' do
    subject(':search') { Search.new.search(args) }

    let(:args) { 'rails_event_store_rspec' }

    context 'search with non-existent gem' do
      let(:args) { 'dasdada' }
      it 'return message when no results found' do
        expect(subject).to eq(1)
      end
    end

    # it 'data is returned correctly' do
    #   binding.pry
    #   expect(subject.gem_name).to eq('rails_event_store_rspec')
    # end



    it 'return exit code 0' do
      expect(subject).to eq(0)
    end
  end
end