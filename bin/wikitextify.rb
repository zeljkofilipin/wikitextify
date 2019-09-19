File.foreach('txt/sos.txt') do |line|
  puts line.gsub(/https:\/\/phabricator\.wikimedia\.org\/(T\d{6})(#\d{7})*/, '[[phab:\1\2]]')
end
