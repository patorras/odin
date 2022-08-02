=begin
Using iteration, write a method #fibs which takes a number and returns 
an array containing that many numbers from the fibonacci sequence. 
Using an example input of 8, this method should return the 
array [0, 1, 1, 2, 3, 5, 8, 13].
=end

def fibu(input = 8, ar = [])

  i = 0
  
  while i < input do 
    if i == 0
      ar<<0
    elsif i == 1
      ar<<1
    else
      ar<< ar[i - 2] + ar[i - 1]
    end
    i += 1
    
  end
  return ar
end


#p fibu()

def fibu_rec(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fibu_n_1 = fibu_rec(n - 1)
  fibu_n_1 << fibu_n_1[-1] + fibu_n_1[-2]

end

#p fibu_rec(8)


#################################################################################

=begin 
Build a method #merge_sort that takes in an array and returns a sorted array,
 using a recursive merge sort methodology.


    Think about what the base case is and what behavior is happening again and again and
       can actually be delegated to someone else (e.g. that same method!).
    It may be helpful to check out the background videos again if you don’t quite understand
     what should be going on.

=end


def merge_sort(arr)
  if arr.length < 2 
    return arr
  end

  middle = arr.length / 2 

    left_side = merge_sort(arr.slice(0...middle))
    right_side = merge_sort(arr.slice(middle...arr.length))

    merge_array(left_side, right_side)

end


def merge_array (left_side, right_side)

  sorted = []

  while left_side.any? && right_side.any? 
    left_side[0] < right_side[0] ? sorted.push(left_side.shift) : sorted.push(right_side.shift)
  end

  sorted.concat(left_side).concat(right_side)

end

test_array = [1,2,5,3,7,9,6]


p merge_sort(test_array)






