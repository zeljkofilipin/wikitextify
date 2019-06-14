# frozen_string_literal: true

require 'wikitextify'

RSpec.describe 'wikitextify' do
  it 'changes long Gerrit links to short' do
    long = 'https://gerrit.wikimedia.org/r/c/mediawiki/extensions/Wikibase/+/507910'
    short = '[[gerrit:507910]]'
    expect(gerrit(long)).to eq short
  end
  it 'changes long Phabricator links to short' do
    long = 'https://phabricator.wikimedia.org/T224324'
    short = '[[phabricator:T224324]]'
    expect(phabricator(long)).to eq short
  end
  it 'knows if line contains a link' do
    line_with_link =
      '*** https://phabricator.wikimedia.org/T221177 to [[phab:T221177]]'
    line_without_link = '== SoS Meeting Bookkeeping =='
    expect(link?(line_without_link)).to be false
    expect(link?(line_with_link)).to be true
  end
end
