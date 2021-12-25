def diamond(integer)
  diamond_outline_length = []
  1.upto(integer) do |diamond_line_length|
    diamond_outline_length << diamond_line_length if diamond_line_length.odd?
  end
  (integer - 2).downto(1) do |diamond_line_length|
    diamond_outline_length << diamond_line_length if diamond_line_length.odd?
  end

  diamond_outline_length.each do |diamond_line_length|
    if diamond_line_length == 1
      puts '*'.center(integer)
    else
      diamond_inside_space = ' ' * (diamond_line_length - 2)
      diamond_line = '*' + diamond_inside_space + '*'
      puts diamond_line.center(integer)
    end
    #puts ('*' * diamond_line_length).center(integer) #original
  end

end

diamond(1)
diamond(5)
diamond(9)