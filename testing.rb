require './enumerables.rb'

test_array1 = [11, 2, 3, 56]
test_array2 = %w[a b c d]

# my_each
p 'my_each'
test_array1.my_each { |x| p x }
test_array2.my_each { |x| p x }
p test_array2.my_each

# my_each_with_index
p 'my_each-with_index'
test_array1.my_each_with_index { |x, y| p "item: #{x}, index: #{y}" }
test_array2.my_each_with_index { |x, y| p "item: #{x}, index: #{y}" }
p test_array2.my_each_with_index

# my_select
p 'my_select'
p test_array1.my_select(&:even?)
p test_array2.my_select { |x| x == 'c' }
p test_array2.my_select

# my_all?
p 'my_all?'
p %w[ant bear cat].my_all? { |word| word.length >= 3 }
p %w[ant bear cat].my_all? { |word| word.length >= 4 }
p %w[ant bear cat].my_all?(/t/)
p [1, 2i, 3.14].all?(Numeric)
p [nil, true, 99].my_all?
p [].my_all?

# my_any?
p 'my_any?'
p %w[ant bear cat].any? { |word| word.length >= 3 }
p %w[ant bear cat].any? { |word| word.length >= 4 }
p %w[ant bear cat].any?(/d/)
p [nil, true, 99].any?(Integer)
p [nil, true, 99].any?
p [].any?

# my_none?
p 'my_none?'
p %w[ant bear cat].none? { |word| word.length == 5 } #=> true
p %w[ant bear cat].none? { |word| word.length >= 4 } #=> false
p %w[ant bear cat].none?(/d/) #=> true
p [1, 3.14, 42].none?(Float) #=> false
p [].none? #=> true
p [nil].none? #=> true
p [nil, false].none? #=> true
p [nil, false, true].none? #=> false

# my_count
p 'my_count'
ary = [1, 2, 4, 2]
p ary.count #=> 4
p ary.count(2) #=> 2
p ary.count(&:even?) #=> 3

# my_map
p 'my_map'
arr = [1, 2, 3, 4, 5]
p arr.my_map { |x| x * x }
p (1..2).my_map { |x| x * x }

# my_inject
p 'my_inject'
# # Sum some numbers
p (5..10).my_inject(:+) #=> 45
# # Same using a block and inject
p (5..10).my_inject { |sum, n| sum + n } #=> 45
# # Multiply some numbers
p (5..10).my_inject(1, :*) #=> 151200
# Same using a block
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200

longest = %w[cat sheep bear].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
p longest #=> "sheep"
