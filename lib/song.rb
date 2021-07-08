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
		song = Song.new
		song.save
		song
	end
	
	def self.new_by_name(name)
		song = self.new
		song.name = name
		song
		
	end
	
	def self.create_by_name(name)
		song = self.create
		song.name = name
		song
	end
	
	def self.find_by_name(name)
		your_song = self.all.find {|songs| songs.name == name}
	end

	def self.find_or_create_by_name(name)
		if self.find_by_name(name)
			self.find_by_name(name)
		else
			self.create_by_name(name)
		end
	end
	
	def self.alphabetical
		self.all.sort_by {|s| s.name}
	end

	def self.new_from_filename(name)
		song_array = name.split(" - ")
		artist_name = song_array[0]
		song_name = song_array[1].gsub(".mp3","")
		song = self.new
		song.name = song_name
		song.artist_name = artist_name
		song
	end
	
	def self.create_from_filename(name)
		song = self.create_by_name(name)
		song_array = name.split(" - ")
		artist_name = song_array[0]
		song_name = song_array[1].gsub(".mp3","")
		song.name = song_name
		song.artist_name = artist_name
	end

	def self.destroy_all
		self.all.clear
	end

end
