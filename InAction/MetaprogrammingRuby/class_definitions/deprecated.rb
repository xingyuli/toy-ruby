class Book

  def title
    puts "title is called"
  end

  def sub_title
    puts "sub_title is called"
  end

  def lend_to_user(user)
    puts "lend_to_user is called"
  end

  def self.deprecate(old_method, new_method)
    define_method old_method do |*args, &block|
      warn "Warning: #{old_method} is deprecated. Use #{new_method} instead."
      send(new_method, *args, &block)
    end
  end

  deprecate :GetTitle, :title
  deprecate :title2, :sub_title
  deprecate :LEND_TO_USER, :lend_to_user

end

b = Book.new
b.LEND_TO_USER('Bill')
