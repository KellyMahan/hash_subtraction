require 'spec_helper'

describe HashSubtraction do

  before :all do
    @h1 = {
      a: 'a', 
      b: 'b', 
      c: 'c', 
      arr: [1,2,3],
      hsh: {
        a: '1',
        b: 'b',
        c: 'see',
        e: 'hello there mello'
      },
      int: 10,
      float: 10
    }
    @h2 = {
      b: 'b', 
      c: 'c', 
      arr: [1,2],
      hsh: {
        a: '1',
        c: 'dee',
        e: 'ello'
      },
      int: 8,
      float: 6.5
    }
  end
  
  it "should remove any duplicate keys" do

    @h1.extend(HashSubtraction)
    h3 = @h1.remove_duplicate_keys(@h2)

    result = {
      a: 'a'
    }
    
    h3.should == result
  end
  
  it "should remove any duplicate key value pair" do

    @h1.extend(HashSubtraction)
    h3 = @h1.remove_duplicates(@h2)

    result = {
      a: 'a',
      arr: [1,2,3],
      hsh: {
        b: 'b',
        c: 'see',
        e: 'hello there mello'
      },
      int: 10,
      float: 10
    }
    
    h3.should == result
  end
  
  it "should subtract one hash from another and return the difference" do
    @h1.extend(HashSubtraction)
    h3 = @h1 - @h2
    
    result = {
      a: 'a',
      arr: [3],
      hsh: {
        b: 'b',
        c: 'see',
        e: 'h there m'
      },
      int: 2,
      float: 3.5
    }
    
    h3.should == result
  end
  
  it "should find the difference between 2 hashes" do
    @h1.extend(HashSubtraction)
    h3 = @h1.diff(@h2)
    
    result = {
      a: "a", 
      arr: [1, 2], 
      hsh: {
        b: "b", c: "dee", e: "ello"
      }, 
      int: 8, 
      float: 6.5
    }
    
    h3.should == result
  end
  
  
  
end