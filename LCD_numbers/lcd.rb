#!/usr/bin/env ruby
#
nums = {
  5 => [" - ", "|  ", " - ", "  |", " - "],
  6 => [" - ", "|  ", " - ", "| |", " - "],
}

0.upto(4) do |i|
  sum = nums.values.inject() do |sum, line|
    sum += line[i]
    sum += " "
  end
  puts sum
end
