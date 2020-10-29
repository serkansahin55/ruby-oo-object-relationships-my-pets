class Owner
  attr_reader :name, :species
  @@all = []

  def initialize (name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner==self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner==self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.select {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.select {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.select do |pets| 
      if pets.owner==self
        pets.mood = "nervous"
        pets.owner = nil
      end
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end 