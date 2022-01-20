# [3, 2, 9, 6, 5]
# if 3 bigger then 2?
    # then we swap 3 with 2, [2, 3, 9, 6, 5]
# if 3 is bigger then 9 we swap? since this is not true, nothing should happen
# if 9 is bigger then 6? 
    # then we swap 9 with 6, [2, 3, 6, 9, 5]
# if 9 is bigger then 5?
    # then we swap 9 with 5, [2, 3, 6, 5, 9]
# we just did a complete pass through the list, it just looks like this [2, 3, 6, 5, 9]
# we can note that in the first pass the biggest number went to the end of the array
# so we just need to ensure we do enough passes through the list so everything is sorted

# times to run through array is size of the array - 1, or n - 1

# to optimize we can check if array is == to array.sort?


def bubble_sort (array)

    until array == array.sort do
        array.each_with_index do |number, index|
            if (index + 1) < array.size 
                if array[index] > array[index+1]
                    array[index], array[index+1] = array[index+1], array[index]  
                end
            end
        end 
    end
    
    return array

end


p bubble_sort([4,3,78,2,0,2])