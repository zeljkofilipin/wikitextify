# frozen_string_literal: true

require 'wikitextify'

RSpec.describe 'wikitextify' do
  it 'changes long Phabricator links to short' do
    long = 'https://phabricator.wikimedia.org/T224324'
    short = '[[phabricator:T224324]]'
    expect(phabricator(long)).to eq short
  end
end
