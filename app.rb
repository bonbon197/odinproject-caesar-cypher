#caesar cypher


def cypher (phrase, shift)
    # establish the needed items
    letters = ("a".."z").to_a
    phrase_to_array = phrase.chars

    #the actual logic
    phrase_to_array.map do |char| 
        if char == char.upcase
          letters.include?(char.downcase) ? letters[(letters.find_index(char.downcase)) + shift - letters.length].upcase : char
        else
          letters.include?(char) ? letters[(letters.find_index(char)) + shift - letters.length] : char 
        end
    end.join
end




# for each character in the letters array, there will be an assigned index
# find the index in the letters array for each matching letter from the phrase array
# to check, reassign to letters using the index from the map method
# ok that didn't work out as I expected. Spaces are counted as nil, think of something else.

# check if the passed character is a space, or any other character for that matter
# ok that worked

# now figure out a way to wrap around after shifting
# letter index - shift
# ok that works

# now figure out cases
# if what is being passed in the map is an upcase, do upcase return. if not then not

print cypher("Zygotes are cells I think", 2)