puts 'part 1'

class Book
  def title
    @title.upcase! #returns nil if the caller is not mutated
    @title # returns the upcased value even if it has not been mutated
  end

  def author
    @author
  end

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

puts
puts 'part 2'

class Book
  attr_accessor :author, :title

  def initialize # we add to redefine the initialize method, or creating a new object will still use the method definition from part1
  end
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)