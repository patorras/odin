def caesar_cipher(string, number_shift)

    # then converted to a number ascii  
    # change the char number using the number_shift 
   ascii_numbers = string.bytes.map do |number|
    if number == 32
        number = number
    else
        number + number_shift
    end
   end

   # change back the numbers to strings ascii
   ascii_numbers = ascii_numbers.map do |letter| 
    if letter > 90 && letter < 97
        letter = letter - 25
        letter.chr
    elsif letter > 122 
        letter = letter - 25
        letter.chr
    else 
        letter.chr
    end
   end
   ascii_numbers = ascii_numbers.map {|letter| letter.chr}


   ascii_numbers = ascii_numbers.join('')
   puts ascii_numbers


end

caesar_cipher("Pedro difjeidnewj", 5)
 
