begin
  File.open('not_exist', 'r')
rescue
  puts $!, $!.class
ensure
  puts "ensure is executed"
end

for item in 1..10
  puts "iterating at #{item}"
  if item % 2 == 1
    next
  end
  print "do something with ", item, "\n"
end

def raise_exception(*args)
  raise *args
end

begin
  # RuntimeError
  raise_exception
rescue
  puts "1 rescue invoked: #{$!.class}"
  puts $!
end

begin
  # RuntimeError
  raise_exception "bad mp3 encoding"
rescue
  puts "2 rescue invoked: #{$!.class}"
  puts $!
end

class InterfaceError < RuntimeError; end

begin
  # InterfaceException
  raise_exception InterfaceError, "Keyboard failure", caller
rescue
  puts "3 rescue invoked: #{$!.class}"
  puts $!
end


class RetryError < RuntimeError
  attr :ok_to_retry
  def initialize(ok_to_retry)
    @ok_to_retry = ok_to_retry
  end
end

