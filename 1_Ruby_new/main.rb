def sayGoodnight(name)
  "Goodnight, #{name}"
end

# Time for bed...
puts sayGoodnight('John-Boy')
puts sayGoodnight('Mary-Ellen')

# $variableName  global variable
# @variableName  instance variable
# @@variableName class variable
# ClassName, ModuleName, ConstantName

a = [ 1, 'cat', 3.14 ]
puts a[0]
a[2] = nil
puts a
puts a.join(', ')

empty1 = []
empty2 = Array.new
puts empty1
puts empty2

a = %w{ ant bee cat dog elk }
puts a[0]
puts a[3]

instSection = {
    'cello'     => 'string',
    'clarinet'  => 'woodwind',
    'drum'      => 'percussion',
    'oboe'      => 'woodwind',
    'trumpet'   => 'brass',
    'violin'    => 'string'
}
puts instSection
# a hash by default returns nil when indexed by a key it doesn't contain
puts instSection['bassoon']

# specifying a default value when you create a new hash
histogram = Hash.new(0)
puts histogram['key1']
histogram['key1'] = histogram['key1'] + 1
puts histogram['key1']

radiation = 3001
if radiation > 3000
  puts 'Danger, Will Robinson'
end

puts 'Danger, Will Robinson' if radiation > 3000

square = 3
while square < 1000
  square = square*square
end
puts "square is #{square}"

square = 3
square = square*square while square < 1000
puts "square is #{square}"
puts Math.sqrt(square)

line = 'I like Ruby.'
if line =~ /Ruby|Python/
  puts "Scripting language mentioned: #{line}"
end

puts line.sub(/Ruby/, 'Python')

def callBlock
  yield
  yield
end

callBlock { puts 'In the block' }

# both %w{} and %() works
a = %w( ant bee cat dog elk )
a.each { |animal| puts animal }

[ 'cat', 'dog', 'horse' ].each do |animal|
  print animal , ' -- '
end

5.times { print '*' }
3.upto(6) { |i| print i }
('a'..'e').each {|char| print char}

printf 'Number: %5.2f, String: %s', 1.23, 'Hello'

line = gets
print line

ARGV << 'testfile'
print $_ while gets

ARGV << 'testfile'
ARGF.each { |line| print 'Via ARGF: ',line }
