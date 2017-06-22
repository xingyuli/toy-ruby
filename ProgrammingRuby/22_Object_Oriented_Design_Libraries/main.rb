require 'singleton'

class MyClass
  include Singleton
end

a = MyClass.instance
b = MyClass.instance
puts "a: #{a}"
puts "b: #{b}"
