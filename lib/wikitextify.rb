# frozen_string_literal: true

def gerrit(line)
  line.gsub(
    %r{https://gerrit\.wikimedia\.org/r/(#\S*)?(\d{6})(/?)},
    '[[gerrit:\2]]'
  )
end

def git(line)
  line.gsub(
    /git #(\w{7,8})/,
    '[[gerrit:q/\1]]'
  )
end

def mediawiki(line)
  line.gsub(
    %r{https://www\.mediawiki\.org/wiki/(\S+)},
    '[[\1]]'
  )
end

def phabricator(line)
  line.gsub(
    %r{(https://phabricator\.wikimedia\.org/)?(T\d{6})+(#\d{7})?},
    '[[phab:\2\3]]'
  )
end

def wikitech(line)
  line.gsub(
    %r{https://wikitech\.wikimedia\.org/wiki/(\S+)},
    '[[wikitech:\1]]'
  )
end
