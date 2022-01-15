# maybe convert word to a array, then compare if word exists in dictionary, filling a hash


dictionary = ["below", "below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]



def substrings(word, array)

    hash = {}

    # converts string to a array
    word = word.split(" ")


    word.each do |letter|
        array.each do |string|
            if letter.downcase.include?(string) 

                if hash[string] == nil 
                    hash[string] = 1
                elsif hash[string] > 0
                    hash[string] += 1
                end

            end
        
        end
    end
    
    puts hash.sort.to_h

end


substrings("Howdy partner, sit down! How's it going?", dictionary)