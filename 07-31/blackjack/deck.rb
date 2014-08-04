class Deck
  attr_reader :cards, :drawn

  def initialize
    @cards, @drawn = [], []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def draw
    # Internally tracks which cards have been drawn,
    # then returns this card
    card = @cards.pop
    @drawn.push card
    card
  end

  def reshuffle
    @cards += @drawn
    @drawn = []
    @cards.shuffle!
  end
end
