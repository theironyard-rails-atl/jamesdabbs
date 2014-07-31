### 2. Quiz
#
# You should be able to specify questions (~5-10) like so:
#
# ```
# # Preferably something with better answers ...
# Questions = [
#   {
#      question: "Why did the chicken cross the road?",
#      choices: [
#        "Why does anyone do anything?",
#        "To get to the other side",
#        "Something something something YOUR MOM",
#        "Mu"
#      ],
#      answer: 1
#   },
#   {
#     question: "...",
#     ...
#   }
# ]
# ```
#
# Then running `ruby quiz.rb` should display the questions
# one at a time in random order, ask the user for input,
# and display their score when done. Bonus: display which
# questions the user got right / wrong with answers at the
# end.

questions = [{
     question: "Why did the chicken cross the road?",
     choices: [
       "Why does anyone do anything?",
       "To get to the other side",
       "Something something something YOUR MOM",
       "Mu"
     ],
     answer: 1
  }, {
    question: "Am I right?",
    choices: [
      "Yes"
    ],
    answer: 0
  }
]

#########

right = []
wrong = []

questions.each do |current_question|
  puts current_question[:question]

  # Display each choice with an index
  i = 1
  current_question[:choices].each do |choice|
    puts "#{i}) #{choice}"
    i += 1 # or i = i + 1
  end
  print "Your answer? > "

  user_answer = gets.chomp

  if user_answer.to_i == current_question[:answer] + 1 # the answer is correct
    puts "You got it!"
    right << current_question
  else
    puts "You got it wrong :("
    wrong << current_question
  end
end

puts "You got #{right.count} right and #{wrong.count} wrong out of #{questions.count}"
unless wrong.empty?
  puts "You missed:"
  wrong.each do |q|
    puts "x #{q[:question]}"
  end
end
