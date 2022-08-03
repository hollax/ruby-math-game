class Player
    LIVES = 5
    attr_accessor :name, :lives
  
    
    def initialize(name, lives = LIVES)
      @name = name
      @lives = lives
    end

    def lose_live
      @lives -= 1
    end
end