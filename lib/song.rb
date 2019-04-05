class Song
  attr_accessor :name, :artist_name, :create
  @@all = []

  def initialize(name,artist_name=nil)
    @name = name
    @artist_name = artist_name
    #binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new(name) 
  end

  def self.new_by_name(name) 
    Song.new(name)
    #binding.pry
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.find_by_name(song_name)
    all.find do |songs|
      #binding.pry
      songs.name == song_name
      
    end
    #binding.pry
  end

  def self.find_or_create_by_name(what)
    
    create_by_name(what)
    find_by_name(what)
    
  end

  def self.alphabetical
    #all[0].name #returns name of instance 
    #binding.pry
    new_array = all.sort_by do |instances|
      #binding.pry
      instances.name
    end
  end

  def self.new_from_filename(string)
    string = string.split(" - ")
    #@artist_name = string[0]
    #@name = string[1]
    Song.new(string[1].chomp(".mp3"),string[0])
    #binding.pry
  end
  
  def self.create_from_filename(string)
    string = string.split(" - ")
    #@artist_name = string[0]
    #@name = string[1]
    Song.new(string[1].chomp(".mp3"),string[0])
    #binding.pry
  end

  def self.destroy_all
     @@all = []
  end
end


