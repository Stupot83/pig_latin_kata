# Develop your proram to handle multiple consonants at the start of words.
#
# The rule is:
# If the word starts with one or more consonants, move them to the end.
# e.g. cram     -> amcray
#      sprinkle -> inklespray
#
# Still assume the words are lowercase.

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
assert_equal(pig_latin("cram"), "amcray")
assert_equal(pig_latin("sprinkle"), "inklespray")
assert_equal(pig_latin("dog"), "ogday")
assert_equal(pig_latin("up"), "upway")
