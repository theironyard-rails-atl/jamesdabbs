class Person
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def score
    hand.value
  end

  def busted?
    hand.busted?
  end

  def blackjack?
    hand.blackjack?
  end
end


class Dealer < Person
  attr_accessor :deck

  def initialize
    @deck = Deck.new
    super
  end

  def shuffle
    deck.reshuffle
  end

  def deal(*people)
    people.each do |person|
      person.hand = Hand.new
      person.hand.add(deck.draw)
      person.hand.add(deck.draw)
    end
  end

  def hit(person)
    person.hand.add(deck.draw)
  end

  def should_hit?
    score < 17
  end
end


class Player < Person
  attr_accessor :money

  def initialize
    @money = 100
    super
  end

  def in_game?
    money > 0
  end

  def win(amount, odds=1)
    self.money += amount * odds
  end

  def lose(amount)
    self.money -= amount
  end
end
