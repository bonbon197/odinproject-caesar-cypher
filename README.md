# Hopefully I did this right

## Doing an explanation like this also helps me understand what I just did, so forgive the long winded assault of words.

So first off let's define a method that will accept two parameters, the input phrase and the number shift
In our case, we'll name it "cypher".

```ruby
def cypher (phrase, shift)
end
```
For now let's prepare what we'll possibly need for our operations
We'll make an array for each letter in the alphabet, in lower case, that will serve as a reference for our cypher later.

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
end
```

Then another array, that is converted from the phrase that was passed as a parameter for the method.

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
  phrase_to_array = phrase.chars
end
```
We'll leave it at those for now

We all know that arrays have an index number assigned to each item. Those index numbers will serve as the "number reference" which we'll use for the logic of the method.

Now we move on over to the actual logic and operation for the cypher.

Since we converted the phrase into an array, we can do a \#map method on it.

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
  phrase_to_array = phrase.chars

  phrase_to_array.map do |char|
  end
end
```

For each character in the phrase, we'll cross reference it with the letters array to see if it's there, using an if else.
This is to avoid throwing off the code when you pass in a special character like spaces or "!" or "?".

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
  phrase_to_array = phrase.chars
  phrase_to_array.map do |char|
    letters.include?(char) ? letters[(letters.find_index(char))] : char
  end
end
```

Once we've confirmed that's working, we add the shhift value.

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
  phrase_to_array = phrase.chars
  phrase_to_array.map do |char|
    letters.include?(char) ? letters[(letters.find_index(char)) + shift] : char
  end
end
```

With this, it has pretty much covered the basic outcome we want.

```ruby
print cypher("dogs", 2) 
=> fqiu
```

However, logic right now doesn't cover wrapping from z to a and beyond.
What we'll do is subtract the current index value from the `letters[(letters.find_index(char)) + shift]` with the total length of the letters array, which in this case is 26. The total number of all letters in the alphabet. Hopefully you see where I'm going with this.

```ruby
def cypher (phrase, shift)
  letters = ("a".."z").to_a
  phrase_to_array = phrase.chars
  phrase_to_array.map do |char|
    letters.include?(char) ? letters[(letters.find_index(char)) + shift - letters.length] : char
  end
end
```

Hopefully I can illustrate the logic better with this flow
=> phrase = `"zygote"`
=> shift factor = `2`
=> index numbers are as follows when crossed with the letters array: `25, 24, 6, 14, 19, 4`
=> index + shift factor: `27, 26, 8, 14, 19, 4`
=> (index + shift) - letters.length: `1, 0, -18, -12, -7, -22`

Negative indeces count backwards from the last item in the array, so `letters[-18]` gives us the letter "i", which is two steps to the right of the letter "g", in line with what we've set as the shift factor.

So the final array we get is `b, a, i, q, v, g`

The last item left in the requirements is to check the cases so we could keep the same character cases as the input.

For this, I simply wrapped it in an if else statement, to check if what was inputted were either in upper case or lower case.

```ruby
def cypher (phrase, shift)
    letters = ("a".."z").to_a
    phrase_to_array = phrase.chars
    phrase_to_array.map do |char| 
        if char == char.upcase
          letters.include?(char.downcase) ? letters[(letters.find_index(char.downcase)) + shift - letters.length].upcase : char
        else
          letters.include?(char) ? letters[(letters.find_index(char)) + shift - letters.length] : char 
        end
    end
end
```

After all that, what's outputted is still an array. So simply add a `.join` method at the end of the map method and it should be gucci.


# There's gotta be a better way to deal with this. If anything's amiss, or if a refactor could be suggested, please do so. I'm very new to ruby
