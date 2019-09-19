File.foreach('input.txt') do |line|
  phabricator_line = line.gsub(/(https:\/\/phabricator\.wikimedia\.org\/)*(T\d{6})(#\d{7})*/, '[[phab:\2\3]]')
  gerrit_line = phabricator_line.gsub(/https:\/\/gerrit\.wikimedia\.org\/r\/(\d{6})/, '[[gerrit:\1]]')
  puts gerrit_line
end
