# Provides the `ask` helper function
# You'll need to `gem install highline` to use this
require "highline/import"

require "./card"
require "./deck"
require "./hand"
require "./person"

class Blackjack
  attr_reader :dealer, :player

  def initialize
    @dealer = Dealer.new
    @player = Player.new
  end

  def play
    while player.in_game?
      play_round
      break if ask_again == "n"
    end

    puts "Game over. You leave with #{player.money}."
  end

  def ask_again
    ask 'Would you like to play again? (y/n) ' do |question|
      question.in = %w(y n)
    end
  end

  def ask_hit_or_stand
    ask 'Do you want to (h)it or (s)tand? ' do |question|
      question.in = %w(h s)
    end
  end

  def ask_for_bet(player)
    ask 'How much do you want to bet? ' \
        "(max $#{player.money}) ", Integer do |question|
      question.default = 10
      question.in = (10..player.money)
    end
  end

  def player_win(bet)
    if player.blackjack?
      puts 'You have a blackjack and win at 3:2!'
      player.win(bet, 1.5)
    else
      puts 'You win!'
      player.win(bet)
    end
  end

  def player_lose(bet, message='You lose!')
    puts message
    player.lose(bet)
  end

  def show_final_score_and_winner(bet)
    puts "The dealer has #{dealer.hand}."
    puts "You have #{player.hand}."

    if dealer.score > player.score
      player_lose(bet)
    elsif player.score > dealer.score
      player_win(bet)
    else
      if dealer.blackjack? && !player.blackjack?
        player_lose(bet, 'The dealer has blackjack. You lose!')
      elsif player.blackjack?
        player_win(bet)
      else
        puts 'You tie and get your bet back.'
      end
    end
  end

  def play_round
    puts "\n"

    bet = ask_for_bet(player)

    dealer.shuffle
    dealer.deal(dealer, player)

    puts "Dealer is showing #{dealer.hand.showing}."
    puts "You have a hand of #{player.hand}."
    move = ask_hit_or_stand
    while move == 'h' && !player.busted?
      dealer.hit(player)
      puts "You have a hand of #{player.hand}."
      move = ask_hit_or_stand unless player.busted?
    end

    if player.busted?
      puts 'You busted!'
      player_lose(bet)
      return
    end

    while dealer.should_hit?
      puts 'The dealer hits.'
      dealer.hit(dealer)
      puts "The dealer has #{dealer.hand}."
    end

    if dealer.busted?
      puts 'The dealer busted!'
      player_win(bet)
      return
    else
      puts 'The dealer stands.'
    end

    # show final score and credit/debit player
    show_final_score_and_winner(bet)
  end
end

if $PROGRAM_NAME == __FILE__
  Blackjack.new.play
end
