=begin

Write a program that, given a word, computes the Scrabble score for that word.

A, E, I, O, U, L, N, R, S, T 	1
D, G 	                        2
B, C, M, P 	                  3
F, H, V, W, Y 	              4
K 	                          5
J, X 	                        8
Q, Z 	                        10

How to Score: sum the values of all the tiles used in each word

ex: cabbage
    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

problem: find the scrabble score of a word
input: word, composed of a-z
-uppercase/lowercase allowed? Yes
-spaces/special characters allowed? Yes
-verification for other input types? no
-order doesn't matter, repetition matters
output: number
-sum the score of each individual letter

E: no verification of input
  Scrabble class, instance methods: initialize(obj), score

D: input: array of chars
rules: hash: key: each char: value: score for that char
output: integer

A: convert the input string to an array 'word_arr' of uppercase characters
  calculate the score for each character and return the sum of them.
=end

class Scrabble

  # CHAR_SCORE = {}
  # ('A'..'Z').each do |letter|
  #   case
  #   when %w(A E I O U L N R S T).include?(letter) then CHAR_SCORE[letter] =	1
  #   when %w(D G).include?(letter) then CHAR_SCORE[letter] = 2
  #   when %w(B C M P).include?(letter) then CHAR_SCORE[letter] = 3
  #   when %w(F H V W Y).include?(letter) then CHAR_SCORE[letter] = 4
  #   when %w(K).include?(letter) then CHAR_SCORE[letter] = 5
  #   when %w(J X).include?(letter) then CHAR_SCORE[letter] = 8
  #   when %w(Q Z).include?(letter) then CHAR_SCORE[letter] = 10
  #   end
  # end   #bad practice??

  def initialize(word)
    @word = word.instance_of?(String) ? word.upcase.delete('^A-Z') : ''
  end

  def score
    @word.chars.inject(0) {|sum,letter| sum + self.class.char_value(letter)}
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def self.char_value(letter)
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when 'D', 'G' then 2
    when 'B', 'C', 'M', 'P' then 3
    when 'F', 'H', 'V', 'W', 'Y' then 4
    when 'K' then 5
    when 'J', 'X' then 8
    when 'Q', 'Z' then 10
    end
  end
end
