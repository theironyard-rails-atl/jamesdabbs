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


class Cheater < Person
  def blackjack?
    true
  end
end


class Dealer < Person
  attr_accessor :deck

  def initialize
    super
    @deck = Deck.new
    #@hand = Hand.new
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
    self.score < 17
  end
end


class Player < Person
  attr_accessor :money
  # Getter:
  # def money
  #   @money
  # end
  # Setter:
  # def money= amount
  #   @money = amount
  # end

  def initialize
    @money = 100
    super
  end

  def in_game?
    money > 0
  end

  def win(amount, odds=1)
    self.money += amount * odds
    # Equivalent:
    # self.money = self.money + (amount * odds)
    # NOT EQUIVALENT! Only sets local variable `money`
    # money = money + (amount * odds)

    # attr_writers ALWAYS need @ or self.
  end

  def lose(amount)
    self.money -= amount
  end
end
