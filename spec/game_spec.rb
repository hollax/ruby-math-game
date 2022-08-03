require "game"                                                                                                   
require "player"                                                                                                   
                                                                                                                    
RSpec.describe Game  do                                                                                 
  context "#initialize" do                                                                            
    it "Creates game" do  
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2')                                                                         
      game = Game.new([p1, p2])                                                                                       
      expect(game.players.length).to eq 2                                                                                                  
      expect(game.players[0]).to eq p1                                                                                                  
      expect(game.players[1]).to eq p2                                                                                                  
    end   
    it "Removes duplicate players" do  
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2')                                                                         
      game = Game.new [p1, p2, p2]                                                                                       
      expect(game.players.length).to eq 2                                                                                                  
    end   
    it "raise error if array is not passed" do  
      expect{ Game.new 1}.to raise_error("First parameter must be array of numbers")                                                                                               
    end                                                                                                             
   end     
  context "#swith_turn" do
    it "Changes current player" do   
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2')                                                                     
      p3 = Player.new('P3')                                                                     
      game = Game.new([p1, p2, p3])
                                                                                             
      expect(game.current_player).to eq p1       
      
      game.swith_turn

      expect(game.current_player).to eq p2      
      expect(game.players.length).to eq 3      

      game.swith_turn

      expect(game.current_player).to eq p3     
      expect(game.players.length).to eq 3      

      game.swith_turn

      expect(game.current_player).to eq p1   
      expect(game.players.length).to eq 3      
      
      game.swith_turn
      
      expect(game.players.length).to eq 3      


    end      

   it "Ignore players without live" do   
    p1 = Player.new('P1')                                                                     
    p2 = Player.new('P2', 0)                                                                     
    p3 = Player.new('P3')                                                                     
    game = Game.new([p1, p2, p3])
                                                                                           
    expect(game.current_player).to eq p1       
    
    game.swith_turn

    expect(game.current_player).to eq p3      
    expect(game.players.length).to eq 3      

  end      
 end
  
  context "#game_over" do
    it "return true if only one player has live" do
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2', 0)                                                                     
      game = Game.new([p1, p2])
                                                                                             
      expect(game.game_over).to eq true 
    end
    it "return false if more than one player has live" do
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2', 0)                                                                     
      p3 = Player.new('P3')                                                                     
      game = Game.new([p1, p2, p3])
                                                                                             
      expect(game.game_over).to eq false 
  end
  end 
  context "#active_players" do

  end
  context "#winner" do
    it "return nill if game not over" do
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2')                                                                     
      p3 = Player.new('P3')                                                                     
      game = Game.new([p1, p2, p3])

      expect(game.winner).to be_nil
    end
    it "return player with live" do
      p1 = Player.new('P1', 0)                                                                     
      p2 = Player.new('P2')                                                                     
      p3 = Player.new('P3', 0)                                                                     
      game = Game.new([p1, p2, p3])

      expect(game.winner).to eq p2
    end
  end
  context "#get_question" do
    it "generate question" do
      p1 = Player.new('P1')                                                                     
      p2 = Player.new('P2')                                                                     
      game = Game.new([p1, p2])
      question = game.get_question
      expect(question).to be_a_kind_of Question::Base

    end
  end
  context "#setup" do                                                                            
      it "Setup game" do      
        playerNum = 4
        #generate player names
        names = (0...playerNum).to_a.collect {|e| "Player #{e}"}
        #spread names to mock user input
        allow(Object).to receive(:gets).and_return("#{playerNum}", *names)
        game = Game.setup                                                                 
        expect(game).to be_an_instance_of Game   
        expect(game.players.length).to eq playerNum

      end                                                                                                             
  end                                                                                                               
end