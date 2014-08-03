class Card
  SUITS = [:C, :D, :H, :S]
  RANKS = [:A] + (2..10).to_a + [:J, :Q, :K]

  attr_reader :rank, :suit
  # or, equivalently
  # def rank
  #   @rank
  # end
  # def suit
  #   @suit
  # end

  def initialize(rank, suit)
    # Note: you can combine assignments on one line like so.
    # This is particularly common in initialize methods.
    @rank, @suit = rank, suit
  end

  def value
    if @rank == :A
      1
    elsif [:J, :Q, :K].include?(@rank)
      10
    else
      @rank
    end
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end
