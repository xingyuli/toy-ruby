def math(a, b)
  yield(a, b)
end

# block to Proc, operation is an instance of Proc
def teach_math(a, b, &operation)
  puts "Let's do the math"

  # Proc to block, &operation is a block
  puts math(a, b, &operation)
end

teach_math(2, 3) { |x, y| x * y }
