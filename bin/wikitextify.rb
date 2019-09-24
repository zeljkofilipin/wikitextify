# frozen_string_literal: true

require('./lib/wikitextify.rb')

File.foreach('input.txt') do |line|
  phabricator_line = phabricator(line)
  gerrit_line = gerrit(phabricator_line)
  git_line = git(gerrit_line)
  mediawiki_line = mediawiki(git_line)
  wikitech_line = wikitech(mediawiki_line)
  puts wikitech_line
end
