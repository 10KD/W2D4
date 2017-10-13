#
#
#
#
#
#
#
def first_anagram?(str1, str2)
  anagrams = str1.chars.permutation.to_a
  str2_to_arr = str2.chars
  anagrams.include?(str2_to_arr)
end
# first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
  str1.chars.each_with_index do |char, idx|
    str2.chars.each_with_index do |char2, idx|
      if char == char2
        str1 = str1[0...idx] + str1[idx + 1...str1.length]
        str2 = str2[0...idx] + str2[idx + 1...str2.length]
        break
      end
    end
  end
  str1.empty? && str2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  # hash1 = Hash.new(0)
  # hash2 = Hash.new(0)
  # str1.chars.each do |char|
  #   hash1[char] += 1
  # end
  # str2.chars.each do |char2|
  #   hash2[char2] += 1
  # end

  # hash1.each do |key, value|
  #   return false if !hash2[key] || value != hash2[key]
  # end
  # true
  hash = Hash.new(0)
  (0...str1.length).each do |i|
    hash[str1[i]] += 1
  end
  (0...str2.length).each do |j|
    hash[str2[j]] -= 1
  end
  hash.values.all? { |el| el == 0 } 
end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")
