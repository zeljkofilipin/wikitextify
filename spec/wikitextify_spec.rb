# frozen_string_literal: true

require 'wikitextify'

RSpec.describe 'Gerrit ' do
  it 'shortens long links' do
    long =
      '** Performance: CR of RDBMS change '\
      "https://gerrit.wikimedia.org/r/#/c/mediawiki/core/+/394430/\n"
    short =
      "** Performance: CR of RDBMS change [[gerrit:394430]]\n"
    expect(gerrit(long)).to eq short
  end
  it 'shortens short links' do
    long =
      '** SRE: Need CR and deploy for Apache SVG compression fix. – '\
      "https://gerrit.wikimedia.org/r/535860\n"
    short =
      '** SRE: Need CR and deploy for Apache SVG compression fix. – '\
      "[[gerrit:535860]]\n"
    expect(gerrit(long)).to eq short
  end
  it 'shortens multiple links' do
    long =
      '** Performance: CR of RDBMS change '\
      'https://gerrit.wikimedia.org/r/#/c/mediawiki/core/+/394430/ '\
      "https://gerrit.wikimedia.org/r/535860\n"
    short =
      '** Performance: CR of RDBMS change [[gerrit:394430]] '\
      "[[gerrit:535860]]\n"
    expect(gerrit(long)).to eq short
  end
end
RSpec.describe 'Git' do
  it 'creates links' do
    long =
      'Updated linters in Citoid (git #ac54ad79), '\
      "CodeMirror (git #81ce8b3)\n"
    short =
      'Updated linters in Citoid ([[gerrit:q/ac54ad79]]), '\
      "CodeMirror ([[gerrit:q/81ce8b3]])\n"
    expect(git(long)).to eq short
  end
end
RSpec.describe 'Phabricator ' do
  it 'shortens task links' do
    long = "** Analytics: https://phabricator.wikimedia.org/T229882\n"
    short = "** Analytics: [[phab:T229882]]\n"
    expect(phabricator(long)).to eq short
  end
  it 'shortens tag links' do
    long = '*** History & diffs - beginning development against prototype '\
      "endpoints https://phabricator.wikimedia.org/tag/ios-app-v6.5/\n"
    short = '*** History & diffs - beginning development against prototype '\
      "endpoints [[phab:tag/ios-app-v6.5]]\n"
    expect(phabricator(long)).to eq short
  end
  it 'shortens multiple links' do
    long = '** Analytics: https://phabricator.wikimedia.org/T229882 '\
      "https://phabricator.wikimedia.org/T232691\n"
    short = "** Analytics: [[phab:T229882]] [[phab:T232691]]\n"
    expect(phabricator(long)).to eq short
  end
  it 'shortens links with anchors' do
    long = "** Analytics: https://phabricator.wikimedia.org/T232691#5488675\n"
    short = "** Analytics: [[phab:T232691#5488675]]\n"
    expect(phabricator(long)).to eq short
  end
  it 'creates links' do
    long = "** Implement firstChange logging (task T229079)\n"
    short = "** Implement firstChange logging (task [[phab:T229079]])\n"
    expect(phabricator(long)).to eq short
  end
end
RSpec.describe 'MediaWiki ' do
  it 'shortens MediaWiki links' do
    long = '** Discussing expanding the topic models with the Growth Team: '\
      'https://www.mediawiki.org/wiki/Topic:Ub3g57qa9gflrlrc & '\
      "https://phabricator.wikimedia.org/T231506\n"
    short = '** Discussing expanding the topic models with the Growth Team: '\
      '[[Topic:Ub3g57qa9gflrlrc]] & '\
      "https://phabricator.wikimedia.org/T231506\n"
    expect(mediawiki(long)).to eq short
  end
  it 'shortens Wikitech links' do
    long = '*** Production incident caused instability in eqiad cluster '\
      'https://wikitech.wikimedia.org/wiki/Incident_documentation/20190913-maps'\
      "\n"
    short = '*** Production incident caused instability in eqiad cluster '\
      '[[wikitech:Incident_documentation/20190913-maps]]'\
      "\n"
    expect(wikitech(long)).to eq short
  end
end
