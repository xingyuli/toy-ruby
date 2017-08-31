class MyClass

  attr_accessor :another_attr

  def my_attribute=(value)
    @my_attribute = value
  end
  def my_attribute
    @my_attribute
  end

end

puts MyClass.new.instance_variables