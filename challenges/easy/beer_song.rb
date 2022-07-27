# generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.
=begin

--verse method
problem: return the selected verse line
input: verse number: verse for 'n' bottles, second verse number (optional)
- from 99 to 0
- begin at 99 and ends at 0
- when the second verse is declared, go from 'verse number' to 'second verse number'
output: verse line
- no s to 'bottle' when there is 1 -> for verse 2 and 1
- 0: replace nb by 'no more' -> for verse 1 and 0
- verse 0: second line unique.
requirements:
validation of input? no

E: BeerSong class
class method: verse(verse1, verse2 = nil) ; lyrics

D: input: integer (from 0 to 99)
output: string
rules: use a template for the verse

A: if there is no second argument (verse2 == nil):
      take the template and replace the numbers accordingly
        for first line, use number
          if number is 1, replace bottles by bottle
        for second line, use number - 1
          if number - 1 is 1, replace bottles by bottle
                              replace 'one' by 'it'
          if number - 1 is 0, use the final verse line
    if there is a second argument
      call the same method, from verse1 to verse2 and append each return values to a new array
      join the array with a newline

--lyrics method
problem: return the whole song
input:none ;
output: the whole song
-each verse is separated by 2 newlines
D: helper method: verse(99, 0)
=end

# class BeerSong
#   LAST_VERSE_LINE2 = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

#   def self.verse(verse_num)
#     verse_line1(verse_num) + verse_line2(verse_num - 1)
#   end

#   def self.verses(verse_num1, verse_num2)
#     verse_arr = []
#     verse_num1.downto(verse_num2) do |num|
#       verse_arr << verse(num)
#     end

#     verse_arr.join("\n")
#   end

#   def self.lyrics
#     verses(99, 0)
#   end

#   class << self
#     private

#     def correct_line!(verse_line, line_num)
#       case line_num
#       when 1 then verse_line.gsub!('bottles', 'bottle')
#       when 0
#         verse_line.gsub!('0', 'no more').capitalize!
#         verse_line.sub!('one', 'it')
#       end
#     end

#     def verse_line1(n)
#       verse_line = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n"

#       correct_line!(verse_line, n) if [0, 1].include?(n)
#       verse_line
#     end

#     def verse_line2(n)
#       return LAST_VERSE_LINE2 if n == -1

#       verse_line = "Take one down and pass it around, #{n} bottles of beer on the wall.\n"

#       correct_line!(verse_line, n) if [0, 1].include?(n)
#       verse_line
#     end
#   end
# end

class BeerSong
  def self.verse(number)
    case number
    when 2 then two_beers
    when 1 then one_left
    when 0 then none_left
    else
      standard(number)
    end
  end

  def self.verses(first, last)
    order = (last..first).to_a.reverse
    order.map { |number| verse(number) }.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end


  class << self
    private

    def standard(number)
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n" \
    end

    def two_beers
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    end

    def one_left
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end

    def none_left
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end