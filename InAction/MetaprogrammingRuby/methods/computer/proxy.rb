class Computer

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|method_missing|respond_to?/
  end

  def method_missing(method, *args)
    super unless respond_to?(method)
    info = @data_source.send "get_#{method}_info", @id
    price = @data_source.send "get_#{method}_price", @id
    result = "#{method.to_s.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end

end

require_relative 'data_source'

computer = Computer.new(42, DS.new)
puts computer.mouse
puts computer.cpu
puts computer.keyboard
puts computer.display
puts computer.respond_to? 'mouse'
