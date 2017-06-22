def cool_dude(arg1='Miles', arg2='Coltrane', arg3='Roach')
  "#{arg1}, #{arg2}, #{arg3}"
end

puts cool_dude
puts cool_dude('Bart')
puts cool_dude('Bart', 'Elwood')
puts cool_dude('Bart', 'Elwood', 'Linus')

def varargs(arg1, *rest)
  "Got #{arg1} and #{rest.join(', ')}"
end
puts varargs('one')
puts varargs('one', 'two')
puts varargs('one', 'two', 'three')

def take_block(p1)
  if block_given?
    yield p1
  else
    p1
  end
end

puts take_block('no block')
puts take_block('no block') { |s| s.sub('no ', '') }

class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    "#{@name} on #{amount} = #{@block.call(amount)}"
  end
end

tc = TaxCalculator.new("Sales tax") { |amt| amt * 0.075 }
puts tc.get_tax(100)
puts tc.get_tax(250)

def five(a, b, c, d, e)
  "I was passed #{a}, #{b}, #{c}, #{d}, #{e}"
end

puts five(1, 2, 3, 4, 5)
puts five(1, 2, 3, *%w(a b))
puts five(*(10..14).to_a)

print "(t)imes or (p)lus: "
times = gets
print "number: "
number = gets.to_i

# if times =~ /t/
#   puts (1..10).collect { |n| n*number }.join(", ")
# else
#   puts (1..10).collect { |n| n+number }.join(", ")
# end

if times =~ /t/
  calc = proc { |n| n*number }
else
  calc = proc { |n| n+number }
end
puts (1..10).collect(&calc).join(", ")


def into(an_array)
  proc { |val| an_array << val }
end

(1..10).each(&into(a = []))
puts a
