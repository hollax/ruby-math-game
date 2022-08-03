require_relative "player.rb"     
require_relative "question"     

class Game

    attr_reader :players
    attr_reader :current_player
    attr_reader :current_question
    

    def initialize(players)
      
      if players.class != Array
        raise "First parameter must be array of numbers"
      end

      #remove duplicate players based on name
      players = players.uniq{|x| x.name}
      
      if players.length < 2
        throw "Two or more players needed to play the game"
      end

      @current_player_index = 0;
      @players = players
      @current_player = @players[@current_player_index]
    end

    def winner
      active = active_players
      if active.length == 1
        active.first
      end
    end

    def game_over
      active_players.length < 2
    end

    def active_players
      @players.filter{|x| x.lives > 0}
    end

    def swith_turn
      unless game_over
        select_next = true
        
        while select_next
          @current_player_index += 1;
          if @current_player_index >= @players.length
            @current_player_index = 0
          end
          @current_player = @players[@current_player_index]
          select_next = @current_player.lives < 1
          
        end
      
      end
    end

    def stats 
      @players.map{|x| "#{x.name}: #{x.lives}"}.join(" ")
    end

    def get_question 
      question_class = [Question::Addition, Question::Subtraction]
      cls = question_class[rand(0...1)]
      @current_question = cls.new
    end

    def start

      puts "#{@current_player.name}'s turn"
      question = get_question  
      puts question.text

      input = gets.chomp.to_i
      
      if question.correct? input
        puts "Correct!"
      else
        puts "Oops!"
        @current_player.lose_live
      end

      puts "Scores: "
      puts stats
     
      if game_over
        puts "Game over!!!!!!!!"
        puts " "
        puts "#{winner.name} wins"
      else
        swith_turn
        puts "----------------NEW TURN--------------"
        start
      end

    end
        
    def self.setup

      puts 'Welcome to math game'
      puts 'How many players?'

      maxPlayers = gets.chomp.to_i
      players = [];
      for x in 0...maxPlayers
          puts "Enter player #{x+1} name"
          name = gets.chomp
          players.push(Player.new name)
      end

      game = Game.new players

      return game
    end
end