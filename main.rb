require "./lib/game.rb"

begin
    game = Game.setup
    game.start    
rescue => e
    puts "Error occured", e
end

