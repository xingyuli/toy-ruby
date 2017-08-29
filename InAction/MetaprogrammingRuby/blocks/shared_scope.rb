class MyClass

  def initialize
    define_counter
  end

  private

  def define_counter
    shared = 0
    self.class.send :define_method, :counter do
      shared
    end
    self.class.send :define_method, :inc do |x|
      shared += x
    end
  end

end

obj = MyClass.new
puts obj.counter
puts obj.inc 3