# fruit = { :apple => 1, :banana => 2, :carrot => 3 }

the_question = {
  :question => "Why did the chicken cross the road?",
  :choices => [
    "First choice",
    "Right Answer",
    "Other wrong answer"
  ],
  :answer => 1
}

the_other_question = {
  :question => "Wat?",
  :choices => [
    "Yes",
    "No",
    "Maybe?"
  ],
  :answer => 2
}

questions_list = [ the_question, the_other_question ]

############ No peeking!

score = 0

questions_list.each do |the_current_question|
  puts the_current_question[:question]
  puts the_current_question[:choices]
  user_input = gets.chomp
  puts "You typed in '#{user_input}'"

  index_of_correct_answer = the_current_question[:answer]
  correct_answer = the_current_question[:choices][index_of_correct_answer]

  if user_input.downcase == correct_answer.downcase
    puts "You got it correct"
    score = score + 1 # or score += 1
  else
    puts "You got it incorrect"
    puts "The correct answer was #{correct_answer}"
  end
end

puts "Total is: #{score}"
