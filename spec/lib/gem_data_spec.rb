# frozen_string_literal: true

require './lib/gem_data'

RSpec.describe GemData do
  it 'stores the data passed to the client class' do
    gem = GemData.new('test', 'testing', 'GPL-V2', 1000)

    expect(gem.name).to eq('test')
    expect(gem.info).to eq('testing')
    expect(gem.license).to eq('GPL-V2')
    expect(gem.downloads).to eq(1000)
  end

  it 'returns the license of the gem' do
    gem = GemData.new('test', 'testing', 'GPL-V2', 1000)

    expect(gem.get_license).to eq('GPL-V2')
  end
end