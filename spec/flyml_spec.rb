require 'spec_helper'

describe Flyml do
  let(:env) { 'test' }
  let(:root) { File.join(File.dirname(__FILE__), 'fixtures') }

  subject(:config) { Flyml.config(root: root, env: env) }

  it 'accesses settings within a file' do
    expect(config[:simple]).to eq(foo: 'bar')
  end

  it 'accesses nested settings' do
    expect(config[:nested][:this][:is]).to eq('nested')
  end

  it 'accesses empty files' do
    expect(config[:empty]).to eq({})
    expect(config[:empty][:inexisting]).to eq(nil)
  end

  it 'accesses files only the first time' do
    expect(config[:simple][:foo]).to eq('bar')

    expect(YAML).not_to receive(:load_file)
    expect(config[:simple][:foo]).to eq('bar')
  end
end
