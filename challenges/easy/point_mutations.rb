=begin
Write a program that can calculate the Hamming distance between two DNA strands.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

problem: calculate the hamming distance of two dna strands
input:
2 dna strands
can be of different length
output:
hamming distance : number of different characters in two dna strands, at an equal index
calculated until the shortest dna strand

requirements
-dna strands can be of different lengths
-order matters, repetitions allowed
-characters accepted: A, C, G, T
  only uppercase? no verifications
-other inputs? ignored
-empty dna strand? Yes
  if so, what to return if there is an empty dna strand? 0

examples
class DNA
  instance methods: hamming_distance(string), initialize(string)

Data:
input: arrays
output: integer

Algorithm:
-initialize a counter to 0
- comparare the two strings character by character, and add 1 to counter if they are different.
  - find the shortest strand and iterate through its characters, with index
    compare the character of this index with the character of the other strand at this index
- return counter

=end

class DNA
  def initialize(str)
    @strand = str
  end

  def hamming_distance(other_strand)
    counter = 0

    shortest_strand_length = [@strand, other_strand].map(&:size).min

    shortest_strand_length.times do |idx|
      counter += 1 if @strand[idx] != other_strand[idx]
    end

    counter
  end
end
