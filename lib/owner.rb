class Owner
    attr_reader :name, :species
    attr_accessor :dogs, :cats
    
    @@all = []
    
    def initialize(name)
        @species = "human"
        @name = name
        @@all << self
        @dogs = []
        @cats = []
    end

    def say_species
     "I am a #{self.species}."
    end

    def self.all
        @@all
    end

    def self.count
        self.all.count
    end

    def self.reset_all
        self.all.clear
    end

    def cats
        Cat.all.select {|cat| cat.owner == self}
    end

    def dogs 
        Dog.all.select{|dog| dog.owner == self}
    end

    def buy_cat(name)
        @cats << cat = Cat.new(name, self)
        cat.owner = self
    end

    def buy_dog(name)
        @dogs << dog = Dog.new(name, self)
        dog.owner = self
    end

    def walk_dogs
        Dog.all.select{|dog| dog.mood = "happy" if dog.owner == self}
    end

    def feed_cats
        Cat.all.select{|cat| cat.mood = "happy" if cat.owner == self}
    end

    def sell_pets
        Dog.all.select{|dog| dog.mood = "nervous" if dog.owner == self} && Cat.all.select{|cat| cat.mood = "nervous" if cat.owner == self}
        Dog.all.select{|dog| dog.owner = nil if dog.owner == self} && Cat.all.select{|cat| cat.owner = nil if cat.owner == self}          
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
        


end