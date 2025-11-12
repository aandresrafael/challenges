def MathChallenge(str)
  chars = str.split("")
  digits = []
  digit = ""
  operator = nil
  index = 0
  result = 0
  while index < chars.length
    char = chars[index]
    if char.match?([0..9])
      digit << char
      index += 1
    end
    if ["*", "/", "+", "-"].any?(char)
      operator = char
      digits << digit.to_i
      digit = ""
      index += 1
    end
    if char == "("
      digit_2, index =  get_digit(chars[index..])
      digits << digit_2
    end
    if digits.length == 2 && operator
      result = digits.first.send(operator.to_sym, digits.second)
      digits = [result]
    end
  end
  
  return digits.first.send(operator.to_sym, digits.second)
end

def get_digit(sub_chars, index)
  digit = ""
  digits = []
  operator = nil
  sub_chars.each do |char|
    index += 1
    if char.match?([0..9])
      digit << char
    elsif ["*", "/", "+", "-"].any?(char)
      operator = char
      digits << digit.to_i
      digit = ""
    else char == ")"
      return [digits.first.send(operator.to_sym, digit.to_i), index]
    end
  end    
end

# keep this function call here 
puts MathChallenge(STDIN.gets)
