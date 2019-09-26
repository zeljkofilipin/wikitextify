# frozen_string_literal: true

def gerrit(line)
  line.gsub(
    %r{https://gerrit\.wikimedia\.org/r/(#\S*)?(\d{6})(/?)},
    '[[gerrit:\2]]'
  )
end

def git(line)
  line.gsub(
    /git         # git
    [ ]          # space
    \#           # hash
    (\w{7,8})/x, # 7 or 8 word characters
    '[[gerrit:q/\1]]'
  )
end

def mediawiki(line)
  line.gsub(
    %r{
      https://www\.mediawiki\.org/wiki/ # https://www.mediawiki.org/
      (\S+)                             # 1+ non-whitespace characters
    }x,
    '[[\1]]'
  )
end

def phabricator(line)
  line.gsub(
    %r{(https://phabricator\.wikimedia\.org/)?(T\d{6})+(#\d{7})?|(https:\/\/phabricator\.wikimedia\.org\/)+(\S+)\/}, # rubocop:disable Metrics/LineLength
    '[[phab:\2\3\5]]'
  )
end

def wikitech(line)
  line.gsub(
    %r{
      https://wikitech\.wikimedia\.org/wiki/ # https://wikitech.wikimedia.org/
      (\S+)                                  # 1+ non-whitespace characters
    }x,
    '[[wikitech:\1]]'
  )
end
