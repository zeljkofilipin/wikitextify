# frozen_string_literal: true
require('./lib/wikitextify.rb')

File.foreach('input.txt') do |line|
  phabricator_line =
    line.gsub(
      %r{(https://phabricator\.wikimedia\.org/)*(T\d{6})(#\d{7})*},
      '[[phab:\2\3]]'
    )
  gerrit_line = gerrit(phabricator_line)
  mediawiki_line =
    gerrit_line.gsub(
      %r{https://www\.mediawiki\.org/wiki/(\S+)},
      '[[\1]]'
    )
  puts mediawiki_line
end
