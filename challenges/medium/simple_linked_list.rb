=begin
Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide functions to reverse the linked list and convert a linked list to and from an array.

For each problem:
no verification of input

ELEMENT PBS
vocab:
-tail: when the element has no next element

problem 1: next. find the next element associated to an Element object
no input
output: another element object
if there is no next element, return nil
rules:
next element of an Element object can be assigned on initialization

LINKED LIST PBS
Vocab:
-head:  last elt added to the list

problem 1: push. append an elt to a simple linked list
input: int
-int from 1 to 10
output: linked list mutated
- Element object with a value of int added to linked list
rules:
- the previous last element becomes the 'next' element of the new last element (with the value of int)

problem 2: peek. see the 'visible' element (first out) of the simple linked list
no input
output: int associated with element object
if no element in the list, return nil

problem 3: pop. remove an elt from the list
no input:
output: list mutated.
-first in last out

problem 4: reverse linked list
input: linked list;
output: linked list (no mutation needed)
rules:
first out element becomes first in
..
last in element becomes last out


problem 5: convert to an array
input: linked list:
empty linked list accepted -> empty array
output: array
the first out element is the first element of the array
each 'next' element of the element comes after in the array

problem 6: from_a. convert from an array
input: array or nil;
-empty array accepted -> empty linked list
-if input == nil, return empty linked list
output: linked list
-elt at index 0 is the first out
-each subsequent elt in the array is the 'next' from the preceding one

problem 7: determine size of simple linked list
no input
output: integer
rules: the 'next' element from the element object is part of the size, recursively

problem 8: head
no input; output: element object


E: class Element
instance methods: initialize(obj, next_elt (opt)), datum :value of elt, tail?, next
class SimpleLinkedList
- instance methods: initialize, size, empty?, push(int), peek, pop, head, to_a, reverse
- class method: from_a(array)

D: Element class: instance variable datum, instance variable next
LinkedList class: instance variable last_in_first_out
A:
Element class
>next, >datum: getter methods
>tail? : check if next is nil
SimpleLinkedList
>size: if lifo is nil, return 0
otherwise initialize current_elt as lifo
initialize counter as 1
until current_elt's next is nil, add 1 to counter and replace current_elt as the next one.
>empty?: check if size is 0
>push(int): create a new element with the datum of int, it's next element the olf lifo. put this new element as lifo.
>peek: return the datum of the lifo
>pop: put the next elt of lifo as lifo
>head: getter method
>to_a: if head is nil, return empty array
otherwise set current_elt to head
set array as empty array
loop
  add current_elt datum to array
  set current_elt to the next one,
  stop if the current_elt is nil
return array
>class method from_a(arr)
if arr is empty, return new linked list
otherwise add to this new linked list each elt of the array from last index to first index
>reverse: convert obj to an array, reverse the array, return the array converted back to a list
or
create a new linked list
until current elt is nil
  set current elt to head
  add current elt to linked list
  set current elt to next

return new linked list

=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_elt = nil)
    @datum = datum
    @next = next_elt
  end

  def tail?
    self.next.nil?
  end
end

# linked list implementation 1
# class SimpleLinkedList
#   def initialize
#     @list = []
#   end

#   def size
#     @list.size
#   end

#   def empty?
#     @list.empty?
#   end

#   def push(datum)
#     next_elt = @list.last
#     element = Element.new(datum, next_elt)
#     @list << (element)
#   end

#   def peek
#     return nil if @list.empty?

#     head.datum
#   end

#   def head
#     @list.last
#   end

#   def pop
#     @list.pop.datum
#   end

#   def self.from_a(arr)
#     linked_list = new

#     unless arr == nil
#       arr.reverse_each {|elt| linked_list.push(elt)}
#     end

#     linked_list
#   end

#   def to_a
#     arr = []
#     @list.reverse_each do |elt|
#       arr << elt.datum
#     end

#     arr
#   end

#   def reverse
#     list_r = self.class.new
#     @list.reverse_each do |elt|
#       list_r.push(elt.datum)
#     end

#     list_r
#   end
# end

class SimpleLinkedList
  attr_reader :head

  def self.from_a(arr)
    linked_list = SimpleLinkedList.new
    arr.reverse_each {|datum| linked_list.push(datum)} unless arr == nil

    linked_list
  end

  def size
    # solution 1
    # counter = 0
    # current_elt = head
    # while current_elt
    #   counter += 1
    #   current_elt = current_elt.next
    # end
    # counter

    #solution 2
    to_a.size
  end

  def empty?
    # size == 0 # other solution
    !head
  end

  def push(datum)
    previous_head = @head
    @head = Element.new(datum, previous_head)
  end

  def peek
    return nil if empty?

    head.datum
  end

  def pop
    head_datum = @head.datum
    @head = @head.next

    head_datum
  end

  def to_a
    arr = []
    current_elt = head

    while current_elt
      arr << current_elt.datum
      current_elt = current_elt.next
    end

    arr
  end

  def reverse
    # solution 1
    # list_r = SimpleLinkedList.new
    # current_elt = head

    # while current_elt
    #   list_r.push(current_elt.datum)
    #   current_elt = current_elt.next
    # end

    # list_r

    # solution 2
    arr = to_a.reverse
    self.class.from_a(arr)
  end
end