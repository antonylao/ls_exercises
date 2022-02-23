require 'pry'
require 'io/console'
=begin
algo
if width is 1, then only 1 '+' for horizontal rule and only 1 '|' for vertical line
if width less than that, horizontal rule and vertical line will be empty

if width less than the message length + 4, cut the message so that the message will fit with one space, on the left and right,before the box delimitation (length of message will be reduced to width - 4)

if width more the message length + 4,  center the message

if width or message length + 4 more than terminal size, reassign the width to the terminal size
=end
class Banner
  #attr_reader :message, :width #if the getter method for width is protected or public, line .. works

  def initialize(message_str, custom_width = nil)
    self.message = message_str

    if custom_width
      self.width = custom_width
    else
      self.width = message.length + 4 # message is the private getter method
    end

    width_limit = IO.console.winsize[1] # width of the terminal window
    if width > width_limit # width is the private getter method
                           # self.width cannot be called because `width()` is private!
      self.width = IO.console.winsize[1]
    end
  end

  def to_s
    if width <= 0
      ['', '', '', '', ''].join("\n")
    elsif width == 1
      ['+', '|', '|', '|', '+'].join("\n")
    else
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    end
  end

  private

  attr_accessor :message, :width


  def horizontal_rule

    "+" + ('-' * (width - 2)) + "+"
  end

  def empty_line
    "|" + (' ' * (width - 2)) + "|"
  end

  def message_line
    case
    when width == 2 || width == 3
      "|#{' ' * (width - 2)}|"
    when width < message.length + 4
      "| #{message[0, width - 4]} |"
    else
      "| #{message.center(width - 4)} |"
    end
  end

  def center_message(message, width)
    if width < message.length + 4

    else

    end

  end


end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner

banner = Banner.new('', 1)
puts banner
