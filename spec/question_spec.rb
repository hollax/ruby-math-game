require "question"                                                                                                   
                                                                                                                    
RSpec.describe Question::Addition do      
                                                                      
   context "#initialize" do                                                                            
     it "Creates question" do                                                                        
       question = Question::Addition.new                                                                                       
       expect(question).to be_an_instance_of Question::Addition                                                                                                  
     end    
     it "Generate text" do                                                                        
      question = Question::Addition.new                                                                                       
      expect(question.text).to be_a_kind_of String                                                                                                  
    end                                                                                                             
   end      
   context "#correct" do                                                                            
    it "return true for correct answer" do                                                                        
      question = Question::Addition.new    
      #access protected property
      ans = question.instance_eval{@ans}                                                                                   
      expect(question.correct? ans).to eq true                                                                                                  
    end    
    it "return false for incorrect answer" do                                                                        
      question = Question::Addition.new    
      expect(question.correct? -1).to eq false                                                                                                       
   end                                                                                                             
  end                                                                                                                
 end
 RSpec.describe Question::Subtraction do      
                                                                         
  context "#initialize" do                                                                            
    it "Creates question" do                                                                        
      question = Question::Subtraction.new                                                                                       
      expect(question).to be_an_instance_of Question::Subtraction                                                                                                  
    end    
    it "Generate text" do                                                                        
     question = Question::Subtraction.new                                                                                       
     expect(question.text).to be_a_kind_of String                                                                                                  
   end                                                                                                             
  end      
  context "#correct" do                                                                            
   it "return true for correct answer" do                                                                        
     question = Question::Subtraction.new    
     #access protected property
     ans = question.instance_eval{@ans}                                                                                   
     expect(question.correct? ans).to eq true                                                                                                  
   end    
   it "return false for incorrect answer" do                                                                        
     question = Question::Subtraction.new    
     expect(question.correct? -1).to eq false                                                                                                       
  end                                                                                                             
 end                                                                                                                
end
