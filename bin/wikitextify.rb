# frozen_string_literal: true

require('./lib/wikitextify.rb')

File.foreach('input.txt') do |line|
  puts git(gitiles(gerrit(mediawiki(phabricator(wikitech(line))))))
end
