require './lib/command_factory'

RSpec.describe 'CommandFactory' do
  describe "create" do
    subject(:create) { CommandFactory.create(printer, args) }

    let(:args) { [] }
    let(:printer) { StringIO.new }

    context "with no args" do
      it { is_expected.to be_a(Noop) }
    end

    context "with show and no arguments" do
      let(:args) { ["show"] }

      it { is_expected.to be_a(Show) }
    end

    context "with show and a gem name" do
      let(:args) { ["show", "rails"] }

      it { is_expected.to be_a(Show) }
    end

    context "with snow" do
      let(:args) { ["snow"] }

      it { is_expected.to be_a(Noop) }
    end
  end
end