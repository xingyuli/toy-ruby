class Note
  attr_accessor :value
  def initialize(val)
    @value = val
  end
  def to_s
    @value.to_s
  end
end

class Chord
  def initialize(arr)
    @arr = arr
  end
  def play
    @arr.join('-')
  end
end

# c = Chord.new([
#     Note.new("G"),
#     Note.new("Bb"),
#     Note.new("Db"),
#     Note.new("E") ])
# File.open("posterity", "w+") do |f|
#   Marshal.dump(c, f)
# end

chord = nil
File.open("posterity") do |f|
  chord = Marshal.load(f)
end
puts chord.play

#################################
# Custom Serialization Strategy #
#################################

class Special
  def initialize(valuable)
    @valuable = valuable
    @volatile = "Goodbye"
  end
  def _dump(depth)
    @valuable.to_s
  end
  def Special._load(str)
    Special.new(str)
  end
  def to_s
    "#{@valuable} and #{@volatile}"
  end
end

a = Special.new("Hello, World")
data = Marshal.dump(a)
obj = Marshal.load(data)
puts obj

