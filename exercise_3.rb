# Develop your work so far to treat 'qu' as a special case, so that those words
# end in 'quay'
# e.g. quick -> ickquay
#      quilt -> iltquay
#      qat   -> atqay

def pig_latin(word)
  first_letter = word[0].downcase
  two_letter = word[0] + word[1]
  if ["a", "e", "i", "o", "u"].include?(first_letter)
    return "#{word}way"
  elsif two_letter == "qu"
    return "#{word.tr("qu", "") + "qu" + "ay"}"
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
assert_equal(pig_latin("quick"), "ickquay")
assert_equal(pig_latin("quilt"), "iltquay")
assert_equal(pig_latin("qat"), "atqay")
