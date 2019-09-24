# frozen_string_literal: true

require('./lib/wikitextify.rb')

File.foreach('input.txt') do |line|
  phabricator_line = phabricator(line)
  gerrit_line = gerrit(phabricator_line)
  mediawiki_line = mediawiki(gerrit_line)
  puts mediawiki_line
end
