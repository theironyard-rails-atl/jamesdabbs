### 1. Class Questions

# Update (/ rewrite) your quiz script to
#
# 1.
#  * Define a Question class
#  * Use Question objects in place of the hashes used
#    earlier
#
# 2.
#  * Be more flexible about user input (can use a or 1)
#  * Validate and handle bad user input
require "pry"

class Question
  attr_reader :prompt, :choices

  def initialize prompt, choices
    @prompt, @choices = prompt, choices

    # Store the _text_ of the answer so we can compare
    #   even out-of-order
    @answer = @choices.first

    # Shuffle the choices to eliminate bias
    @choices.shuffle!
  end

  def correct? number
    choice_hash[number] == @answer
  end

  def choice_hash
    # @choices.each_with_object({}) do |choice, hash|
    #   hash[i] = choice
    #   i += 1
    # end
    result = {}
    i = 1
    @choices.each do |choice|
      result[i] = choice
      i += 1
    end
    result
  end

  def answer_to_int ans
    if ans.to_i > 0
      ans.to_i
    elsif ("a".."z").include? ans
      ("a".."z").to_a.index(ans) + 1
    elsif ("A" .. "Z").include? ans
      ("A".."Z").to_a.index(ans) + 1
    else
      ans
    end
  end

  def get_answer
    print "> "
    response = answer_to_int(gets.chomp)

    unless choice_hash[response]
      puts "'#{response}' is not a valid response. Choose one of #{choice_hash.keys}"
      get_answer
    end

    response
  end
end


if $PROGRAM_NAME == __FILE__
  questions = [
    Question.new(
      "What does wherefore mean?",
      ["Why", "Where", "Wat"]),
    Question.new(
      "Yes?",
      ["Yes", "No", "Maybe"])
  ]

  score = 0

  questions.shuffle.each do |q|
    puts q.prompt
    q.choice_hash.each do |number, choice|
      puts "#{number}) #{choice}"
    end
    answer = q.get_answer
    score += 1 if q.correct?(answer)
    puts # a blank line
  end

  puts "You scored #{score} out of #{questions.count}"
end
