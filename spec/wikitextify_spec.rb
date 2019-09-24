# frozen_string_literal: true

require 'wikitextify'

RSpec.describe 'wikitextify' do
  it 'shortens Gerrit links' do
    long =
      '** Performance: CR of RDBMS change '\
      "https://gerrit.wikimedia.org/r/#/c/mediawiki/core/+/394430/\n"
    short =
      "** Performance: CR of RDBMS change [[gerrit:394430]]/\n"
    expect(gerrit(long)).to eq short
  end
  it 'shortens Phabricator links' do
    long = "** Analytics: https://phabricator.wikimedia.org/T229882\n"
    short = "** Analytics: [[phab:T229882]]\n"
    expect(phabricator(long)).to eq short
  end
  it 'shortens MediaWiki links' do
    long = '** Discussing expanding the topic models with the Growth Team: '\
      'https://www.mediawiki.org/wiki/Topic:Ub3g57qa9gflrlrc & '\
      "https://phabricator.wikimedia.org/T231506\n"
    short = '** Discussing expanding the topic models with the Growth Team: '\
      '[[Topic:Ub3g57qa9gflrlrc]] & '\
      "https://phabricator.wikimedia.org/T231506\n"
    expect(mediawiki(long)).to eq short
  end
end
