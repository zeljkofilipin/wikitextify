# frozen_string_literal: true

def gerrit(line)
  line.gsub(
    %r{
      https://gerrit\.wikimedia\.org/r/ # https://gerrit.wikimedia.org/
      (\#\S*)?                          # optional path to repo
      (\d{6})                           # 6 digit patch number
      /?                                # optional trailing slash
    }x,
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

# rubocop:disable Metrics/MethodLength
def phabricator(line)
  line.gsub(
    %r{
      # https://phabricator.wikimedia.org/, optional
      (https://phabricator\.wikimedia\.org/)?
      (T\d{6})+  # T followed by 6 digits
      (\#\d{7})? # hash followed by 7 digits, optional
      |          # or
      # https://phabricator.wikimedia.org/
      (https:\/\/phabricator\.wikimedia\.org\/)+
      (\S+)      # 1+ non-whitespace characters
      \/         # trailing slash
    }x,
    '[[phab:\2\3\5]]'
  )
end
# rubocop:enable Metrics/MethodLength

def wikitech(line)
  line.gsub(
    %r{
      https://wikitech\.wikimedia\.org/wiki/ # https://wikitech.wikimedia.org/
      (\S+)                                  # 1+ non-whitespace characters
    }x,
    '[[wikitech:\1]]'
  )
end
