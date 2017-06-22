puts $:

require_relative 'trig'
require_relative 'action'

y = Trig.sin(Trig::PI / 4)
wrongdoing = Action.sin(Action::VERY_BAD)

module Debug
  def whoAmI?
    "#{self.class.name} (\##{self.__id__}): #{self.to_s}"
  end
end
class Phonograph
  include Debug
  def initialize(msg)
    @msg = msg
  end
  def to_s
    @msg
  end
end
class EightTrack
  include Debug
  def initialize(msg)
    @msg = msg
  end
  def to_s
    @msg
  end
end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
puts ph.whoAmI?
puts et.whoAmI?

puts ph.kind_of?(Debug)
puts ph.kind_of?(Phonograph)
puts ph.kind_of?(EightTrack)

puts et.kind_of?(Debug)
puts et.kind_of?(EightTrack)
puts et.kind_of?(Phonograph)

class Song
  attr_reader :name, :artist, :duration
  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
end
puts ">>> Before including Comparable module"
puts Song.instance_methods

class Song
  include Comparable
  def <=>(other)
    duration <=> other.duration
  end
end
puts ">>> After including Comparable module"
puts Song.instance_methods

song1 = Song.new("My Way", "Sinatra", 225)
song2 = Song.new("Bicylops", "Fleck", 260)
puts "song1 <=> song2: #{song1 <=> song2}"
puts "song1 < song2: #{song1 < song2}"
puts "song1 == song1: #{song1 == song1}"
puts "song1 > song2: #{song1 > song2}"

module Notes
  attr :concertA
  def tuning(amt)
    @concertA = 440.0 + amt
  end
end

class Trumpet
  include Notes
  def initialize(tune)
    tuning(tune)
    puts "Instance method returns #{concertA}"
    puts "Instance variable is #{@concertA}"
  end
end

Trumpet.new(-5.3)

module MajorScales
  def majorNum
    @numNotes = 7 if @numNotes.nil?
    @numNotes # Return 7
  end
end

module PentatonicScales
  def pentaNum
    @numNotes = 5 if @numNotes.nil?
    @numNotes # Return 5?
  end
end

class ScaleDemo
  include MajorScales
  include PentatonicScales
  def initialize
    puts majorNum # Should be 7
    puts pentaNum # Should be 5
  end
end

ScaleDemo.new