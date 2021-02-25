require 'pry'


class Owner
  attr_reader :name, :species
  @@all=[]

  def initialize(name)
    @name=name
    @species="human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all=[]
  end 

  def cats
    Cat.all.select do |object|
      object.owner==self
      #binding.pry
    end 
  end 

  def dogs
    Dog.all.select do |object|
      object.owner==self
    end
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each do |dogs|
     dogs.mood="happy"
    end 
  end

  def feed_cats
    self.cats.each do |cats|
      cats.mood="happy"
     end 
  end

  def sell_pets
    cats.each do |cats|
      cats.mood="nervous"
      cats.owner=nil
     end 
     dogs.each do |dogs|
      dogs.mood="nervous"
      dogs.owner=nil
     end 
    end

  def list_pets
    numberdogs= dogs.count
    numbercats= cats.count
    "I have #{numberdogs} dog(s), and #{numbercats} cat(s)."
  end
end