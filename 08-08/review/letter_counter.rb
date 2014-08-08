def count_letters(text)
  counts = {}

  # Can also use `text.each_char`
  chars = text.split("")
  chars.each do |letter|
    #next unless ('a'..'z').includes?(letter)
    if counts[letter]
      counts[letter] += 1
    else
      counts[letter] = 1
    end
  end

  counts # returns the hash `counts` that we built up
end

def count_ms(text_to_count_for_ms)
  count_of_all_letters = count_letters(text_to_count_for_ms)
  count_of_all_letters["m"]
end

count_letters("A SAMPLE STRING")
count_ms("a sample string with some more ms")

def count(text, letter)
  full_count = count_letters(text)
  full_count[letter]
end

count("a sample string with some more ms", "m")

# homework_text = File.read("./questions.md")
#
# hw_counts = count_letters(homework_text)
#
# puts "#{hw_counts["t"]} many t's, #{hw_counts["T"]} T's"
