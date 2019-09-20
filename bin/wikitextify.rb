# frozen_string_literal: true

File.foreach('input.txt') do |line|
  phabricator_line =
    line.gsub(
      %r{(https://phabricator\.wikimedia\.org/)*(T\d{6})(#\d{7})*},
      '[[phab:\2\3]]'
    )
  gerrit_line =
    phabricator_line.gsub(
      %r{https://gerrit\.wikimedia\.org/r/(\d{6})},
      '[[gerrit:\1]]'
    )
  mediawiki_line =
    gerrit_line.gsub(
      %r{https://www\.mediawiki\.org/wiki/(\S+)},
      '[[\1]]'
    )
  puts mediawiki_line
end
