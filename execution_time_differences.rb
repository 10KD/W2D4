def my_min(arr)
  result = arr[0]
  arr.each_index do |i|
    (i+1...arr.length).each do |j|
      if arr[j] < result
        result = arr[j]
      end
    end
  end
  result
end

def my_min(arr)
  min = arr[0]
  (1...arr.length).each do |i|
    min = arr[i] if arr[i] < min
  end
  min
end

# def largest_contiguous_subsum(list)
#   all_sub_arr = []
#   # list.each_index do |i|
#   #   all_sub_arr << list[i]
#   #   sub_arr = list[i]
#   #   (i+1...list.length).each do |j|
#   #     sub_arr << list[j]
#   #     all_sub_arr << sub_arr
#   #   end
#   # end
#   (0...list.length).each do |i|
#     all_sub_arr << [list[i]]
#     (i+1...list.length).each do |j|
#       all_sub_arr << list[i..j]
#     end
#   end
#   max = 0
#   all_sub_arr.each do |arr|
#     curr = arr.inject(:+)
#     if curr > max
#       max = curr
#     end
#   end
#   max
# end

def largest_contiguous_subsum(arr)
  max = nil
  curr = 0
  arr.each do |el|
    if curr < 0
      curr = el
    else
      curr += el
    end
    if max == nil
      max = curr
    elsif curr > max
      max = curr
    end
  end
  max
end
largest_contiguous_subsum([-5, -1, -3])
