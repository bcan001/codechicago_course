
alphabet= "a".."z"
CIPHER = alphabet.to_a
OTHER_CHAR = ['@','#','$','%','^','&','*']


def reverse_cipher(uncoded_message)
  # uncoded_message = "i want a coke!"

  input = uncoded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
  coded_sentence = []

  input.each do |input_characters|
      if CIPHER.include?(input_characters)

            if CIPHER.index(input_characters) + 4 > 25
                  coded_sentence << CIPHER[CIPHER.index(input_characters) - 26 + 4]
            else
                  coded_sentence << CIPHER[CIPHER.index(input_characters) + 4]
            end

      elsif OTHER_CHAR.include?(input_characters) || input_characters == " "
            coded_sentence << OTHER_CHAR.shuffle[0]
      else
            coded_sentence << input_characters
      end
  end
  coded_sentence = coded_sentence.join("")
end


def decoded_cipher(coded_message)
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the Ruby docs.
  decoded_sentence = []

 
  input.each do |input_characters|
      if CIPHER.include?(input_characters)
            decoded_sentence << CIPHER[CIPHER.index(input_characters) - 4]
      elsif OTHER_CHAR.include?(input_characters)
            decoded_sentence << " "
      else
            decoded_sentence << input_characters
      end
  end
  decoded_sentence = decoded_sentence.join("")
end


puts "Decoding messages..."
puts decoded_cipher("fi%wyvi%xs^hvmro^csyv#szepxmri")
puts decoded_cipher("asa,&csy^qywx#lezi^er@eajyp^psx$sj%jvii#xmqi&sr#csyv*lerhw!")
puts decoded_cipher("xs*amr@xli%keqi,#csy@qywx#ompp&qi,&nslr#vsqivs.")
puts decoded_cipher("izivcfshc*ks@xs*gsppiki,#wxyhc*levh,%wxyhc#levh.")
puts decoded_cipher("ai@mrxirh^xs%fikmr&sr*xli&jmvwx^sj^jifvyevc@yrviwxvmgxih&wyfqevmri%aevjevi.")
puts 

# DRIVER TESTS GO BELOW THIS LINE
puts "Running tests for `decoded_cipher`..."
puts decoded_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver test code and should print true



puts reverse_cipher("be sure to drink your ovaltine")
puts reverse_cipher("wow, you must have an awful lot of free time on your hands!")
puts reverse_cipher("to win the game, you must kill me, john romero.")
puts reverse_cipher("everybody go to college, study hard, study hard.")
puts reverse_cipher("we intend to begin on the first of february unrestricted submarine warfare.")


