# frozen_string_literal: true

require('./lib/wikitextify.rb')

File.foreach('input.txt') do |line|
  puts git(gerrit(mediawiki(phabricator(wikitech(line)))))
end
