=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

problem: find the anagrams of a word
input: original word, list of words
- other kind of inputs? ignored
- are spaces allowed? or just letters? if so does spaces count as characters for identifying anagrams? ignored
- order of the list doesn't matter
- can there be duplicates of words? how would that change the output? ignored
-what is the list is empty? the word is empty? ignored

output: list of anagrams
-original word is not an anagram of the word.
- order doesn't matter

other requirements
anagram is a set of characters that are the same in a different order (number of same characters matters). if the letters are in the same order (same word), it is not an anagram
if there is no anagram found, return an empty array

E: class Anagram
  instance methods: initialize(str), match(arr)
D: input: string, array for each word (downcased)
  output: array
A: for each word in the list, add to the returned list the word if it is an anagram.
      - convert the original word and the compared word to an array of downcased letters
      - sort them and check value equality


=end

class Anagram
  def initialize(word)
    @original = word.downcase
  end

  def match(arr)
    arr.select do |word|
      anagram?(word)
    end
  end

  private

  def anagram?(word)
    return false if @original == word.downcase

    original_arr = @original.chars
    word_arr = word.downcase.chars
    original_arr.sort == word_arr.sort
  end
end

