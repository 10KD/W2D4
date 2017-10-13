#O(n^2) time complexity due to two nested loops
def bad_two_sum?(arr, target_sum)
  arr.each_index do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false 
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6) # => should be true
bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  large_num = sorted.bsearch { |x| x > target_sum }
  if large_num 
    last_index = sorted.index(large_num)
    (0...last_index - 1).each do |i|
      (i+1...last_index).each do |j|
        return true if arr[i] + arr[j] == target_sum
      end
    end
  else
    arr.each_index do |i|
      (i+1...arr.length).each do |j|
        return true if arr[i] + arr[j] == target_sum
      end
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    diff = target_sum - num 
    hash[num] = diff
    return true if hash[diff] 
  end
  false
end