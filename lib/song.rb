require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(song_name)
    self.all << self.new
    self.all.last.name = song_name
    self.all.pop
  end

  def self.create_by_name(song_name)
    self.create
    self.all.last.name = song_name
    self.all.last
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song_name == song.name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(mp3)
    song_and_artist = mp3.chomp('.mp3').split(' - ')
    self.create
    self.all.last.artist_name = song_and_artist[0]
    self.all.last.name = song_and_artist[1]
    self.all.pop
  end

  def self.create_from_filename(mp3)
    self.all << self.new_from_filename(mp3)
  end

  def self.destroy_all
    self.all.clear
  end

end
