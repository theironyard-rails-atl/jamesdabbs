def display_name(last, first, middle=nil)
  if middle
    "#{first} #{middle} #{last}"
  else
    "#{first} #{last}"
  end
end

def sum(*numbers)
  puts "numbers is #{numbers} (a #{numbers.class})"
  # total = 0
  # numbers.each do |number|
  #   total += number
  # end
  # total
  numbers.reduce { |sum, number| sum + number } # does not change `numbers`
  # [1,2,3,4]
  # [3,3,4]
  # [6,4]
  # [10]
  # => 10
  # or `numbers.reduce(&:+)` <- to_proc
  # or `numbers.reduce(:+)`
end

class Card
  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = [:diamonds, :spades, :clubs, :hearts]

  def initialize(rank=nil, suit=nil)
    if rank
      @rank = rank
    else
      @rank = RANKS.sample
    end

    @suit = suit || SUITS.sample
  end
end

class KeywordCard
  def initialize hash={}
    puts "The argument hash is: #{hash}"
    @rank = hash[:rank] || Card::RANKS.sample
    @suit = hash[:suit] || Card::SUITS.sample
  end
end

class NewerKeywordCard
  def initialize rank: nil, suit: nil
    @rank = rank || Card::RANKS.sample
    @suit = suit || Card::SUITS.sample
  end
end
