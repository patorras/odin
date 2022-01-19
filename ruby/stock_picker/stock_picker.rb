
#You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day 
# or the highest day is the first day.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

# You need to buy before you can sell

# Pay attention to edge cases like when the lowest day is the last day,
# or the highest day is the first day.



def stock_picker(array)


    highest_index = 0
    small_index = 0
    result = 0
    profit = []

# find the profit, so [17,23,6,9,15,8,6,7,2], let's start in index 1
# index 1 - index 0
# index 2 - index 0, index 2 - index 1
# index 3 - index 0, index 3 - index 1, index 3 - index 2,
# index 4 - index 0, index 4 - index 1, index 4 - index 2, index 4 - index 3
    array.each_with_index do |sell, index_sell|
        array.each_with_index do |buy, index_buy|
            if index_sell == index_buy
                break
            else
                if sell - buy > result
                    result = sell - buy
                    highest_index = index_sell
                    small_index = index_buy
                end
                 
            end
        end
    end

    
    profit << small_index
    profit << highest_index
    p profit

end



stock_picker([30,23,6,9,15,8,10,7,1])


