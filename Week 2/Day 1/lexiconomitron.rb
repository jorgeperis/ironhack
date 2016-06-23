class Lexiconomitron

  def eat_t(word)
    result = word.tr('T','')
    result = result.tr('t','')
  end

  def shazam(words)
    words.map!(&:reverse)
    [words.first,words.last].map {|word| eat_t(word)}
  end

  def oompa_lompa(words)
    words.select {|word| word.size <= 3}.map {|word| eat_t(word)}
  end
end
