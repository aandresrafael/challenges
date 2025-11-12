# engineer => 'g' (g, i, r, s are all "unique")
def first_unique_char(string)
  chars = string.chars
  group = {}
  chars.each do |char|
    if group[char]
      group[char] = group[char] + 1
    else
      group[char] = 1
    end
  end
  group.each do |key, value|
    return  key if value == 1
  end
  "no unique in this string"
end
