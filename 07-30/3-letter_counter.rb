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

  counts
end

homework_text = File.read("./questions.md")

hw_counts = count_letters(homework_text)

puts "#{hw_counts["t"]} many t's, #{hw_counts["T"]} T's"
