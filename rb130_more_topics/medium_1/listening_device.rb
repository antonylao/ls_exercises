=begin
Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output the most recent recording using a Device#play method.

problem: listen method: add the return value of a block to `@recordings`
input: block (optional)
output: nil
Q: if no block is given, do nothing


problem: play method: outputs @recordings last element
input: nothing
output: nil
Q: if @recordings is empty, do not display anything
=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
p listener