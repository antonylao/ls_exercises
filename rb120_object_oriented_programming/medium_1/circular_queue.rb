class CircularQueue
  def initialize(nb_elts)
    @elements = [nil] * nb_elts
    @index_creation_order = (0...nb_elts).to_a
  end

  def enqueue(elt)
    @elements[@index_creation_order.first] = elt
    @index_creation_order << @index_creation_order.shift
  end

  def dequeue
    @index_creation_order.each do |index|
      unless @elements[index].nil?
        element = @elements[index]
        @elements[index] = nil
        return element
      end
    end
    nil
  end
end

#further investigation

# class CircularQueue
#   def initialize(nb_elts)
#     @elements = []
#     @size = nb_elts
#   end

#   def enqueue(elt)
#     dequeue if full?
#     @elements.push(elt)
#   end

#   def dequeue
#     @elements.shift
#   end

#   private

#   def full?
#     @elements.size == @size
#   end
# end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil