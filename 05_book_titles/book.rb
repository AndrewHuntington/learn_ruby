class Book
  @@ng_words = ['and', 'in', 'the', 'of', 'a', 'an']

  # setter
  def title=(title)
    @title = title.split.map { |x|
      if !@@ng_words.include?(x)
        x.capitalize
      else
        x
      end
    }.join(" ")
  end

  # getter
  def title
    @title[0].upcase + @title[1..@title.length]
  end

end
