def display_name(last, first, middle=nil)
  if middle
    "#{first} #{middle} #{last}"
  else
    "#{first} #{last}"
  end
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
  def initialize hash
    @rank = hash[:rank]
    @suit = hash[:suit]
  end
end
