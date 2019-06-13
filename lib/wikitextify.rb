# frozen_string_literal: true

def phabricator(url)
  task = url.split('/').last
  "[[phabricator:#{task}]]"
end
