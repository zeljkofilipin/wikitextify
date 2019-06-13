# frozen_string_literal: true

def gerrit(url)
  patch = url.split('/').last
  "[[gerrit:#{patch}]]"
end

def phabricator(url)
  task = url.split('/').last
  "[[phabricator:#{task}]]"
end
