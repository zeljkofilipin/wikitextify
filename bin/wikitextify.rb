File.foreach('txt/sos.txt') do |line|
  puts line.sub(/https:\/\/phabricator\.wikimedia\.org\/(T\d{6})/, '[[phab:\1]]')
end
