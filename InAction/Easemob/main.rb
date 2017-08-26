require 'json'
require 'zlib'

def parse_msg(line)
  msg = JSON.parse(line)
  puts JSON.pretty_generate(msg)
  # case msg['payload']['bodies'][0]['type'].to_s.upcase
  #   when 'TXT'
  #     puts "parse txt msg from #{line}"
  #   when 'IMG'
  #     puts "parse img msg from #{line}"
  #   when 'AUDIO'
  #     puts "parse audio msg from #{line}"
  #   else
  #     puts "currently no not recognized"
  # end
end

Dir.foreach('chatmessages') do |f|
  if f != '.' && f != '..'
    Zlib::GzipReader.open("chatmessages/#{f}") { |gz| gz.each_line { |line| parse_msg(line) } }
  end
end
