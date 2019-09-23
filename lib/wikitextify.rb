# frozen_string_literal: true

def gerrit(line)
  line.gsub(
    %r{https://gerrit\.wikimedia\.org/r/(#\S*)(\d{6})},
    '[[gerrit:\2]]'
  )
end

def link?(line)
  return false if line.scan(%r{https://}) == []

  true
end

def phabricator(url)
  task = url.split('/').last
  "[[phabricator:#{task}]]"
end
