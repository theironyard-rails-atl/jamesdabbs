class Card
  RANKS = (2..10).to_a + [:J, :Q, :K, :A]
  SUITS = [:S, :D, :H, :C]

  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case rank
    when :K
      13
    when :Q
      12
    when :J
      11
    when :A
      1
    else
      rank
    end
  end

  def <=>(other)
    self.value <=> other.value
  end
end


class Deck
  include Enumerable

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards.push Card.new(rank, suit)
      end
    end
  end

  # cards.each do |card|
  #   names << card.to_s
  # end
  def each
    @cards.each { |card| yield card }
  end
end
