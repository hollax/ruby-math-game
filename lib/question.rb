class Question

  class Base
    def text; raise "Text function not implemented"; end
    def correct?; raise "Correct answer function not implemented"; end
  end
  
  class Addition < Base
      
    def initialize
      @num1 = rand 0...100
      @num2 = rand 0...100
      @ans = @num1 + @num2
    end

    def text
      "What is #{@num1} plus #{@num2}?"
    end
    def correct? input
      input == @ans
    end
  end

  class Subtraction < Base
      
    def initialize
      @num1 = rand 0...100
      @num2 = rand 0...100
      @ans = @num1 - @num2
    end

    def text
      "What is #{@num1} minus #{@num2}?"
    end
    def correct? input
      input == @ans
    end
  end
end
