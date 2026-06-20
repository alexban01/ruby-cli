require './lib/noop'

RSpec.describe Noop do
  describe "execute" do
    subject(:execute) { Noop.new(printer).execute(*args) }

    let(:args) { [] }
    let(:printer) { StringIO.new }

    it { is_expected.to eq 1 }

    it "prints to check help" do
      execute

      printer.rewind
      expect(printer.read).to include "rubygems: unknown command. Seek help"
    end
  end
end