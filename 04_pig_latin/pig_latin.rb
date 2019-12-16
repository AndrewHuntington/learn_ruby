def translate phrase
  vowels = ['a', 'e', 'i', 'o', 'u']
  special_cases = ['qu']

  phrase.split().map { |word|
    caps = false

    if word == word.capitalize
      caps = true
    end

    case true
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

    # # this causes problems
    # if caps
    #   p word.capitalize
    # end
  }.join(" ")

end
