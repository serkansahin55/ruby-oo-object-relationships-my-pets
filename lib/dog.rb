class Dog
  attr_reader :name
  attr_accessor :owner, :nervous, :mood
  @@all = []
  
  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end

  def self.all
    @@all
  end

    
end
