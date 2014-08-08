Questions = [
  {
     question: "Why did the chicken cross the road?",
     choices: [
       "Why does anyone do anything?",
       "To get to the other side",
       "Something something something YOUR MOM",
       "Mu"
     ],
     answer: 1
  },
  {
    question: "Two is about 5, right?",
    choices: [
      "No",
      "I literally can't even ...",
      "Close enough!"
    ],
    answer: 2
  },
  {
    question: "Right?",
    choices: [ "Yeah!" ],
    answer: 0
  }
]

# Goal: convert Questions to the list of right answers (text)
#
# First look at q = Questions[0]
q = {
  :question=>"Why did the chicken cross the road?",
  :choices=>
    [ "Why does anyone do anything?",
      "To get to the other side",
      "Something something something YOUR MOM",
      "Mu"
    ],
  :answer => 1 }

correct_index  = q[:answer] # The index of the correct answer
correct_answer = q[:choices][correct_index] # Choice @ index of correct answer

def correct_answer(question)
  correct_index  = question[:answer]
  correct_answer = question[:choices][correct_index]
  return correct_answer
end

# Now we can turn to all the questions at once
# Want: ["To get to the other side", "Close enough!", "Yeah"]
answers = []
Questions.each do |question|
  # Not this - this would be calling the `correct_answer` method on `question`
  # `question` is a Hash, and doesn't have a `correct_answer` method
  # question.correct_answer

  answers.push correct_answer(question) # or << instead of push
end

# Arrays
# - get things out: array[1] ... array.pop (or shift)
# - put things in:  array[1] = value, array.push (or <<)
# - do something with all of the items in the array: each

# Hashes
# - get things out: hash[:key]
# - put things in:  hash[:key] = value
# - there is also an each for hashes (each key,value pair)
h = { :a => 1, :b => 2 }
h[:a] # => 1 - lookup
h[:c] = 3
h[:c] # => 3

# if :z is in the hash h
# can do h.include?(:z), or
if h[:z] # if nil -> nil is false-y
