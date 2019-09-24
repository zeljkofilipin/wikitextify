# frozen_string_literal: true

def gerrit(line)
  line.gsub(
    %r{https://gerrit\.wikimedia\.org/r/(#\S*)(\d{6})},
    '[[gerrit:\2]]'
  )
end

def phabricator(line)
  line.gsub(
    %r{(https://phabricator\.wikimedia\.org/)*(T\d{6})(#\d{7})*},
    '[[phab:\2\3]]'
  )
end
