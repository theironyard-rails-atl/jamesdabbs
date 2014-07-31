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

puts first_question[:question]
puts first_question[:choices]
print "Your answer? > "

user_answer = gets.chomp
puts "Your answer was: #{user_answer}"
