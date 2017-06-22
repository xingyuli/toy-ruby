
######################
# Looking at Objects #
######################

r = 1..10
list = r.methods
puts list.length
puts list.join(", ")
puts list[0..3].join(", ")
puts list.respond_to?('inject')

######################
# Looking at Classes #
######################

klass = Integer
begin
  print klass
  klass = klass.superclass
  print " < " if klass
end while klass
puts
p Integer.ancestors

###############################
# Calling Methods Dynamically #
###############################

# Object#send
puts "John Coltrane".send(:length)
puts "Miles Davis".send("sub", /iles/, '.')

# Method#call
trane = "John Coltrane".method(:length)
miles = "Miles Davis".method("sub")
puts trane.class
puts trane.call
puts miles.call('iles', '.')

def double(a)
  2*a
end
p [1,3,5,7].collect(&method(:double))

# eval
trane = %q{"John Coltrane".length}
miles = %q{"Miles Davis".sub(/iles/, '.')}
puts(eval trane)
puts(eval miles)


################
# System Hooks #
################

module Kernel
  alias_method :old_system, :system
  def system(*args)
    result = old_system(*args)
    puts "system(#{args.join(', ')}) returned #{result}"
    result
  end
end

system('date')

class Class
  alias_method :old_new, :new
  def new(*args)
    result = old_new(*args)
    result.timestamp = Time.now
    result
  end
end

class Object
  def timestamp
    @timestamp
  end
  def timestamp=(a_time)
    @timestamp = a_time
  end
end

class Test; end
obj1 = Test.new
sleep 2
obj2 = Test.new
puts obj1.timestamp
puts obj2.timestamp
