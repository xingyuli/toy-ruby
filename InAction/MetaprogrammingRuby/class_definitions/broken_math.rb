class Fixnum
  alias_method :old_plus, :+

  def +(number)
    self.old_plus(number).old_plus(1)
  end
end

puts 1 + 1