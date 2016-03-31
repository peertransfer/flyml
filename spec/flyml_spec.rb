require 'spec_helper'

describe Flyml do
  before do
    Flyml.env = 'test'
    Flyml.root = File.join(File.dirname(__FILE__), 'fixtures')
  end

  it 'accesses settings within a file' do
    expect(Flyml[:simple]).to eq(foo: 'bar')
  end

  it 'accesses nested settings' do
    expect(Flyml[:nested][:this][:is]).to eq('nested')
  end

  it 'accesses empty files' do
    expect(subject[:empty]).to eq({})
    expect(subject[:empty][:inexisting]).to eq(nil)
  end

  it 'accesses files only the first time' do
    expect(subject[:simple][:foo]).to eq('bar')
    
    expect(YAML).not_to receive(:load_file)
    expect(subject[:simple][:foo]).to eq('bar')
  end
end
