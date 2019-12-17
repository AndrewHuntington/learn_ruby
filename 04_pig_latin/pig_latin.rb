CONTAINS_CAPITAL_LETTER_REGEX = /([A-Z])/
WORD_PUNCTUATION_REGEX = /[\w'-]+|[[:punct:]]+/
PUNCTUATION_REGEX = /[[:punct:]]+/

def translate phrase
  vowels = ['a', 'e', 'i', 'o', 'u']
  special_cases = ['qu']

  worked_phrase = phrase.scan(WORD_PUNCTUATION_REGEX).map { |word|

    case true
    when word.match?(PUNCTUATION_REGEX)
      word = word
    when vowels.include?(word[0].to_s.downcase)
      word = word + "ay"
    when special_cases.include?(word[0..1].to_s.downcase)
      word = word[2..] + "quay"
    when special_cases.include?(word[1..2].to_s.downcase)
      word = word[3..] + word[0] + "quay"
    when !vowels.include?(word[0].to_s.downcase) && !vowels.include?(word[1].to_s.downcase) && !vowels.include?(word[2].to_s.downcase)
      word = word[3..] + word[0..2] + "ay"
    when !vowels.include?(word[0].to_s.downcase) && !vowels.include?(word[1].to_s.downcase)
      word = word[2..] + word[0..1] + "ay"
    when !vowels.include?(word[0].to_s.downcase)
      word = word[1..] + word[0] + "ay"
    else
      "Error!"
    end
  }

  count = 0
  while count < worked_phrase.length
    if worked_phrase[count].match?(PUNCTUATION_REGEX)
      worked_phrase[count-1] = worked_phrase[count-1].chop + worked_phrase[count]
      worked_phrase[count] = ""
      next
    end

    if worked_phrase[count].match?(CONTAINS_CAPITAL_LETTER_REGEX)
      if worked_phrase.length == 1 || count == worked_phrase.length - 1
        worked_phrase[count] = worked_phrase[count].capitalize
      else
        worked_phrase[count] = worked_phrase[count].capitalize + " "
      end
    else
      if worked_phrase.length == 1 || count == worked_phrase.length - 1
        worked_phrase[count] = worked_phrase[count]
      else
        worked_phrase[count] = worked_phrase[count] + " "
      end
    end
    count += 1
  end

  worked_phrase.join()

end
