class Anagrams
  def load
    File.read("wordlist.txt")
  end

  def group
    wordlist = load

    anagrams = {}

    wordlist.each_line do |line|
      line = line.chomp
      occurence = line.downcase.chars.sort.join

      if anagrams.has_key?(occurence)
        anagrams[occurence].push(line)
      else
        anagrams[occurence] = [line]
      end
    end

    anagrams
  end

  def render(anagrams)
    results = ""
    
    anagrams.each_value do |anagram|
      results += anagram.join(' ') + "\n"
    end

    results.chomp
  end
end
