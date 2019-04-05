require 'pry'

class Song

  # Make getter/setter methods for name and artist name
  attr_accessor :name, :artist_name
  # Create an empty array to hold all the Song instances.
  @@all = []

  # This will display the array of all the songs.
  def self.all
    @@all
  end

  # This is where we save the instance to the empty array.
  def save
    # self here is the instance of the class Song. If we call .class on an
    # instance of a class, it returns the class itself. So writing
    # self.class.all is basically the same as Song.all which is the array!
    self.class.all << self
  end

  # Here we want to initialize a new song and save it to the @@all variable.
  def self.create
    # First create a new Song instance
    song = Song.new
    # Next save the song with the song method we defined above.
    song.save
    # Finally we need to return the song instance that was just created.
    song
  end

  # We want to build a class constructor Song.new_by_name that takes in the
  # string name of a song and returns a song instance with that name set as
  # its name property.
  def self.new_by_name(song_name)
    # Here self is the class itself, so self.new creates a new instance.
    song = self.new
    # Next we want to set the name value equal to song_name. Since we set :name
    # as a attr_accessor we can call song.name
    song.name = song_name
    # Last return the instance of the song, not a string!
    song
  end

  # We want to be build a class constructor Song.create_by_name that takes in
  # the string name of a song and returns a song instance with that name set
  # as its name property and the song being saved into the @@all array of songs
  def self.create_by_name(song_name)
    # Here self is the class itself, so if we call the class method .create it
    # will do what that method does above! Create, save, and return the instance.
    song = self.create
    # Next we want to set the name value equal to song_name. Since we set :name
    # as a attr_accessor we can call song.name
    song.name = song_name
    # Always return sting at end
    song
  end

  # Build a class finder Song.find_by_name that accepts the string name of a
  # song and returns the matching instance of the song with that name.
  def self.find_by_name(song_name)
    # We can to use the @@all array here, which is the same as self.all b/c this
    # is a class method not instance method.
    # Detect will pass each entry into the block of code and return the FIRST
    # one for which the block is not FALSE.
    self.all.detect {|song| song.name == song_name}
    # In the above block, song is each instance of the song and we can call .name
    # on an instance b/c :name is an attr_accessor.
  end

  # This method will accept a string name for a song and either return a
  # matching song instance with that name or create a new song with the name
  # and return the song instance. We do this to avoid duplicate songs being
  # created, and is very simple b/c we already have methods that find and
  # create songs by the name!
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  # Build a class method Song.alphabetical that returns all the songs in
  # ascending (a-z) alphabetical order. Remember, self.all is the array!
  def self.alphabetical
    self.all.sort_by{|song| song.name}
    # array.sort_by will automatically sort in alphabetical order
  end

  # Build a class constructor that accepts a filename in the format of
  # " - .mp3", for example "Taylor Swift - Blank Space.mp3".
  # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), the
  # constructor should return a new Song instance with the song name set
  # to "Blank Space" and the artist_name set to "Taylor Swift".
  def self.new_from_filename(filename)
    # .split into an array separated by " - "
    parts = filename.split(" - ")
    # first entry in parts array is the artist name
    artist_name = parts[0]
    # second entry is the song name
    # .gsub replaces ".mp3" with nothing ie. ""
    song_name = parts[1].gsub(".mp3", "")

    # Now we make a new song...
    song = self.new
    # Set :name equal to song_name from above
    song.name = song_name
    # Set :artist_name = artist_name from above
    song.artist_name = artist_name
    # Return the instance.
    song
  end

  # Same as above but using the .create class method!
  # .create will make a new instance, save it to the array, then return it.
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # The Song.destroy_all class method should reset the state of the @@all
  # class variable, the array of songs, to an empty array thereby deleting
  # all previous song instances. (Do with .clear on @@all)
  # self.all is the array b/c of method above!!!
  def self.destroy_all
    self.all.clear
  end

end
