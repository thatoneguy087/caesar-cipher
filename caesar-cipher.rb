# we basically need to take every letter in a string, and shift its character code.
# what are those character codes?

# ('a'..'z').each { |chr| puts chr.ord}

# 97(a) - 122(z)

# so for the amound of shift we simply need to add that amount to the chr.
# what about shifting values past z?
# whenever we try to get past 122, we can simply start over from 97. Probably a condition check.

# okay so heres the plan:
# 1. set up #caesar_cipher with parameters of string and a number
# 2. use #codepoint to convert the string to an array of unicode characters
# 3. go through each element in the array.
  # a. determine if the element is in between valid alphabet values, if not we can skip it.
  # b. add on shift value to each element
  # c. if the value falls out of the range, subtract 26 to loop it
# 6. convert the array of numbers back to letters and join with reduce.

def caesar_cipher(string, shift_value)
  array = string.codepoints
  array = array.map do |num|
    if num.between?(65, 90)
      num + shift_value > 90 ? num + shift_value - 26 : num + shift_value
    elsif num.between?(97, 122)
      num + shift_value > 122 ? num + shift_value - 26 : num + shift_value
    else
      num
    end
  end
  array.reduce('') { |string, num| string << num.chr }
end

p caesar_cipher('What a string!', 5)