class Song

  @@plays = 0

  attr_reader :name, :artist, :duration
  attr_writer :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
  end

  # Virtual Attributes
  def durationInMinutes
    @duration / 60.0    # force floating point
  end
  def durationInMinutes=(value)
    @duration = (value * 60).to_i
  end

  def play
    @plays += 1
    @@plays += 1
    "This song: #{@plays} plays. Total #@@plays plays."
  end

end

aSong = Song.new('Bicylops', 'Fleck', 260)
puts aSong.inspect
puts aSong.to_s

class Song
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end

puts aSong.to_s

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}]"
  end
end

aSong = KaraokeSong.new('My Way', 'Sinatra', 225, 'And now, the...')
puts aSong.to_s

print(aSong.name, aSong.artist, aSong.duration)

aSong.duration = 257
print(aSong.name, aSong.artist, aSong.duration)

puts aSong.durationInMinutes
aSong.durationInMinutes = 4.2
puts aSong.duration

s1 = Song.new('Song1', 'Artists1', 234)
s2 = Song.new('Song2', 'Artists2', 345)
puts s1.play
puts s2.play
puts s1.play
puts s1.play

class SongList
  MAX_TIME = 5 * 60
  def SongList.too_long?(aSong)
    return aSong.duration > MAX_TIME
  end
end

song1 = Song.new('Bicylops', 'Fleck', 260)
puts SongList.too_long?(song1)
song2 = Song.new('The Calling', 'Santana', 468)
puts SongList.too_long?(song2)

class Logger
  private_class_method :new
  @@logger = nil

  def Logger.create
    @@logger = new unless @@logger
    @@logger
  end
end

puts Logger.create.__id__
puts Logger.create.__id__

class Accounts

  private

  def debit(account, amount)
    account.balance -= amount
  end
  def credit(account, amount)
    account.balance += amount
  end

  public

  def transferToSavings(amount)
    debit(@checking, amount)
    credit(savings, amount)
  end

end

class Account
  attr_reader :balance
  protected :balance

  def greaterBalanceThan(other)
    return @balance > other.balance
  end
end

person1 = 'Tim'
person2 = person1.dup
person1[0] = 'J'
puts person1
puts person2

person1 = 'Tim'
person2 = person1
# person1.freeze
# person2[0] = 'J'

h = { 'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine' }
puts h.length

class SongList
  def initialize
    @songs = Array.new
  end

  def push(a_song)
    @songs.push(a_song)
    self
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  # def [](key)
  #   if key.kind_of?(Integer)
  #     return @songs[key]
  #   else
  #     return @songs.find { |it| it.name == key }
  #   end
  #   return nil
  # end

  # Simplified version:
  def [](key)
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |it| it.name == key }
  end
end

list = SongList.new
def add_songs_to_list(list)
  list.push(Song.new('title1', 'artist1', 1))
  list.push(Song.new('title2', 'artist2', 2))
  list.push(Song.new('title3', 'artist3', 3))
  list.push(Song.new('title4', 'artist4', 4))
end

add_songs_to_list list
puts list.delete_first
puts list.delete_first
puts list.delete_last
puts list.delete_last
puts list.delete_last

add_songs_to_list list
puts list[0]
puts list[2]
puts list[9]
puts list['title2']

def three_times
  yield
  yield
  yield
end

three_times { puts 'Hello' }

def fib_up_to(max)
  i1, i2 = 1, 1 # parallel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end

fib_up_to(1000) { |it| print it, ' ' }
puts ['H','A','L'].collect { |it| it.succ }.join(', ')

class File
  def File.open_and_process(*args)
    f = File.open(*args)
    yield f
    f.close
  end
end

File.open_and_process('testfile', 'r') do |aFile|
  print while aFile.gets
end

# File.open_and_process('testfile', 'r') { |it|
#   print while it.gets
# }

def n_times(a_thing)
  return proc { |n| a_thing * n }
end

p1 = n_times 23
puts p1.call(3)
puts p1.call(4)
p2 = n_times 'Hello '
puts p2.call(3)
