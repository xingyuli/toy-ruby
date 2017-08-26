module Printable
  def print
    puts 'Printable#print'
  end
end

module Document
  def print_to_screen
    print
  end

  def print
    puts 'Document#print'
  end
end

class Book
  include Printable
  include Document

  print ancestors
end

Book.new.print_to_screen
