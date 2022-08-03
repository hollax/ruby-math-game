require "player"                                                                                                   
                                                                                                                    
RSpec.describe Player do                                                                                 
   context "#initialize" do                                                                            
     it "Creates player" do                                                                        
       player = Player.new 'Ola'                                                                                       
       expect(player).to be_an_instance_of Player                                                                                                  
     end   
     it "Set player name and lives" do                                                                        
      player = Player.new 'Ola'                                                                                       
      expect(player.name).to eq "Ola"                                                                                                  
      expect(player.lives).to eq 5                                                                                                 
    end      
    it "Use custom lives" do                                                                        
      player = Player.new 'Ola', 10                                                                                       
      expect(player.lives).to eq 10                                                                                                
    end                                                                                                         
   end   
   context "#lose_live" do
    it "Reduce player live" do                                                                        
      player = Player.new 'Ola' 
      player.lose_live                                                                                      
      expect(player.lives).to eq 4        
      player.lose_live     
      player.lose_live       
      expect(player.lives).to eq 2                                                                                        
      end  
   end                                                                                                                 
end
