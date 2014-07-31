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

first_question = {
   question: "Why did the chicken cross the road?",
   choices: [
     "Why does anyone do anything?",
     "To get to the other side",
     "Something something something YOUR MOM",
     "Mu"
   ],
   answer: 1
}

#########

right = 0
wrong = 0

puts first_question[:question]

# Display each choice with an index
i = 1
first_question[:choices].each do |choice|
  puts "#{i}) #{choice}"
  i += 1 # or i = i + 1
end
print "Your answer? > "

user_answer = gets.chomp

if user_answer.to_i == first_question[:answer] + 1 # the answer is correct
  puts "You got it!"
  right += 1
else
  puts "You got it wrong :("
  wrong += 1
end
