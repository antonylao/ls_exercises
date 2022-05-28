=begin
In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, see what happens if you print 3 more factorials (the results won't be correct). Now, reset your Enumerator (use the rewind method). Finally, print 7 more factorials.
=end

factorials = Enumerator.new do |yielder|
               number = 1
               index = 0
               loop do
                 yielder.yield(number) # or yielder << number (alias method)
                 index += 1
                 number *= index
               end
             end

# p factorials.take(7)
7.times { p factorials.next }
3.times { p factorials.next }

factorials.rewind

7.times { p factorials.next }
factorials.each {|nb| p nb ; break if nb > 50000}
p factorials.next