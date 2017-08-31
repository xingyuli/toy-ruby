c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

MyClass = c

puts c.name
puts c.new.my_method
