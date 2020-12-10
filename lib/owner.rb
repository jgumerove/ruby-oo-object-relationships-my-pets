require 'pry'
class Owner
attr_reader :name, :species
@@all = []
def initialize (name)
  @name = name
  @species = "human"
  @@all << self
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
  Cat.all.find_all do |cat|
  cat.owner == self
  end
end
def dogs
  Dog.all.find_all do |dog|
  dog.owner == self
  end
end
def buy_cat(name)
  Cat.new(name, self)
end
def buy_dog(name)
  Dog.new(name, self)
end
def walk_dogs
  self.dogs.each do |dog|
    dog.mood = "happy"
  end
end
def feed_cats
  self.cats.each do |cat|
    cat.mood = "happy"
  end
end
end