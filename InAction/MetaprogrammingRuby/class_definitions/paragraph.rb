paragraph = 'any string can be a paragraph'

def paragraph.title?
  self.upcase == self
end

def index(paragraph)
  puts "add to index: #{paragraph}" if paragraph.title?
end

index(paragraph)
