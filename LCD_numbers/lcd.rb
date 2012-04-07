#!/usr/bin/env ruby
#
shapes = [
  [" - ", "   ", " - ", " - ", "   ", " - ", " - ", " - ", " - ", " - "],
  ["| |", "  |", "  |", "  |", "| |", "|  ", "|  ", "  |", "| |", "| |"],
  ["   ", "   ", " - ", " - ", " - ", " - ", " - ", "   ", " - ", " - "],
  ["| |", "  |", "|  ", "  |", "  |", "  |", "| |", "  |", "| |", "  |"],
  [" - ", "   ", " - ", " - ", "   ", " - ", " - ", "   ", " - ", " - "],
].transpose

# shapes2 isn't as smart as shapes:)
shapes2 = {
  0 => [" - ", "| |", "   ", "| |", " - "],
  1 => ["   ", "  |", "   ", "  |", "   "],
  2 => [" - ", "  |", " - ", "|  ", " - "],
  3 => [" - ", "  |", " - ", "  |", " - "],
  4 => ["   ", "| |", " - ", "  |", "   "],
  5 => [" - ", "|  ", " - ", "  |", " - "],
  6 => [" - ", "|  ", " - ", "| |", " - "],
  7 => [" - ", "  |", "   ", "  |", "   "],
  8 => [" - ", "| |", " - ", "| |", " - "],
  9 => [" - ", "| |", " - ", "  |", " - "],
}

def scale(shape, size)
  shape.each do |line|
    line[1,1] *= size
  end
  new_shape = []
  shape.each do |line|
    if line.include? '|'
      size.times { new_shape << line }
    else 
      new_shape << line
    end
  end
  new_shape
end

num = ARGV[0]
size = ARGV[1].to_i

prints = []
num.each_char do |digit|
  prints << scale(shapes[digit.to_i], size)
end

vertical_size = prints[0].size

0.upto(vertical_size - 1) do |i|
  sum = prints.inject("") do |sum, line|
    sum += line[i]
    sum += " "
  end
  puts sum
end
