num = 8
7.times do
  print num.class, ' ', num, "\n"
  num *= num
end

puts -3.1415926.abs

3.times        { print 'x ' }
1.upto(5)      { |it| print it, ' ' }
99.downto(95)  { |it| print it, ' ' }
50.step(80, 5) { |it| print it, ' ' }

s = %q{general single-quoted string}
puts s

value = 123
s = %Q{general double-quoted string: #{value}}
puts s

aString = <<END_OF_STRING
    The body of the string
    is the input lines up to
    one ending with the same
    text that followed the '<<'
END_OF_STRING
puts aString

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
  def to_s
    "Song: #{@name}--#@artist (#@duration)"
  end
end

class WordIndex
  def initialize
    @index = Hash.new(nil)
  end
  def index(an_object, *phrases)
    phrases.each {|a_phrase|
      a_phrase.scan /\w[-\w']+/ do |a_word|
        a_word.downcase!
        @index[a_word] = [] if @index[a_word].nil?
        @index[a_word].push(an_object)
      end
    }
  end
  def lookup(a_word)
    @index[a_word.downcase]
  end
end

class SongList
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end
  def push(song)
    @songs.push(song)
    @index.index(song, song.name, song.artist)
    self
  end
  def [](key)
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |it| it.name == key }
  end
  def each
    @songs.each {|it| yield it}
  end
  def lookup(a_word)
    @index.lookup(a_word)
  end
end

songs = SongList.new

songFile = File.open('data_songs', 'r')
songFile.each { |line|
  file, length, name, title = line.chomp.split(/\s*\|\s*/)
  name.squeeze!(' ')
  mins, secs = length.scan(/\d+/)
  songs.push Song.new(title, name, mins.to_i*60 + secs.to_i)
}
songFile.close

songs.each {|it| puts it}
puts
puts songs.lookup('Fats')
puts songs.lookup("ain't")
puts songs.lookup('RED')
puts songs.lookup('WoRlD')

digits = 0..9
puts digits.include?(5)
puts digits.min
puts digits.max
print digits.reject {|it| it < 5}, "\n"

class VU

  include Comparable

  attr :volume

  def initialize(volume) # 0..9
    @volume = volume
  end

  def inspect
    '#' * volume
  end

  def to_s
    '#' * volume
  end

  # Support for ranges

  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, 'Volume too big') if @volume >= 9
    VU.new(@volume.succ)
  end

end

medium = VU.new(4)..VU.new(7)
puts medium.to_a
puts medium.include?(VU.new(3))

puts (1..10) === 5
puts (1..10) === 15
puts (1..10) === 3.14159
puts ('a'..'j') === 'c'
puts ('a'..'j') === 'z'
