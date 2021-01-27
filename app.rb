#caesar cypher


def cypher (phrase, shift)
    letters = ("a".."z").to_a
    phrase_to_array = phrase.chars

    phrase_to_array.map do |char| 
        if char == char.upcase
          letters.include?(char.downcase) ? letters[(letters.find_index(char.downcase)) + shift - letters.length].upcase : char
        else
          letters.include?(char) ? letters[(letters.find_index(char)) + shift - letters.length] : char 
        end
    end.join
end

print cypher("What a string!", 5)