require 'pry'

class Song
  attr_accessor :name, :artist_name, :song_title

  @@all = []

    def self.all
      @@all
    end

    def save
      self.class.all << self
    end

    def self.create
      new_song = self.new
      new_song.save
      new_song
    end

    def self.new_by_name(name)
      new_song = self.new
      new_song.name = name
      new_song
    end

  def self.create_by_name(name)
      new_song = self.new
      new_song.name = name
      new_song.save
      new_song
  end

  def self.find_by_name(name)
      @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.map.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
   array = file.split(" - ")
   artist_name = array[0]
   song_title = array[1].chomp(".mp3")

   song = self.new
   song.name = song_title
   song.artist_name = artist_name
   song
  end

  def self.create_from_filename(file)
    array = file.split(" - ")
    artist_name = array[0]
    song_title = array[1].chomp(".mp3")

    song = self.create
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
