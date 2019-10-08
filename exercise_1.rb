# Write a program that takes a word and returns the pig latin version.
# Here are the (simplified) rules of pig latin:
#
# If the word starts with consonant, move it to the end and then add 'ay'
# Or, if the word starts with a vowel, add 'way' to the end
# e.g. dog  -> ogday
#      up   -> upway
#
# Don't worry about handling multiple consonants
# Assume the words are lowercase.
# Assume your user is a developer — e.g. you don't need to write a user interface.

def pig_latin(word)
  first_letter = word[0].downcase
  if ["a", "e", "i", "o", "u"].include?(first_letter)
    return "#{word}way"
  else
    consonants = []
    consonants << word[0]
    if ["a", "e", "i", "o", "u"].include?(word[1]) == false
      consonants << word[1]
      if ["a", "e", "i", "o", "u"].include?(word[2]) == false
        consonants << word[2]
      end
    end
    "#{word[consonants.length..-1] + consonants.join + "ay"}"
  end
end

## Tests:

require_relative "./helpers/assert_equal"
assert_equal(pig_latin("dog"), "ogday")
assert_equal(pig_latin("up"), "upway")
