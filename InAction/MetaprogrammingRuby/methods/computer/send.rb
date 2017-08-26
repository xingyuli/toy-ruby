class Computer

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method name do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.to_s.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end

end

require_relative 'data_source'

computer = Computer.new(42, DS.new)
puts computer.mouse
puts computer.cpu
puts computer.keyboard
puts computer.display
puts computer.respond_to? 'mouse'
