class Hand
  def initialize
    @cards = []
  end

  def add(*cards)
    @cards += cards
  end

  def to_s
    @cards.map { |card| card.to_s }.join(", ")
    # or
    # names = []
    # @cards.each { |card| names << card.to_s }
    # names.join(", ")
  end

  def showing
    @cards[1..-1].map { |card| card.to_s }.join
  end

  def value
    total, aces = 0, 0
    @cards.each do |card|
      total += card.value
      aces += 1 if card.rank == :A
    end

    # Now promote aces if we have any
    while total <= 11 && aces > 0
      total += 10
      aces -= 1
    end

    total
  end

  def blackjack?
    @cards.count == 2 && value == 21
  end

  def busted?
    value > 21
  end
end
