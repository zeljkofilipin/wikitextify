# frozen_string_literal: true

def gerrit(url)
  patch = url.split('/').last
  "[[gerrit:#{patch}]]"
end

def link?(line)
  return false if line.scan(%r{https://}) == []

  true
end

def phabricator(url)
  task = url.split('/').last
  "[[phabricator:#{task}]]"
end
