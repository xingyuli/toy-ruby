class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end
end

aSong = Song.new("Abc", "Parker", 234)

if aSong.artist == "Gillespie" then handle = "Dizzy"
elsif aSong.artist == "Parker" then handle = "Bird"
else handle = "unknown"
end
puts handle

cost = aSong.duration > 180 ? 0.35 : 0.25
puts cost

class Shape; end
class Rectangle < Shape; end
class Square < Rectangle; end
class Circle < Shape; end
class Triangle < Shape; end

s = Square.new
case s
  when Square, Rectangle
    desc = 'rect'
  when Circle
    desc = 'circle'
  when Triangle
    desc = 'tri'
  else
    des = '...'
end
puts desc
