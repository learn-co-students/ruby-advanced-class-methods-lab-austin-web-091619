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
    #initialize a song (maybe Self.new)
    song = self.new
    #going to need to call save 
    song.save
    #must return the song initialized
    song
  end

  def self.new_by_name(name)
    #return a song initialized with a name
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    #maybe nest new_by_name in here
    #save the song
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    #copy the functionality shown in the readme on Person_find_by_name
    #pretty much a call to .find on self.all
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      #run find_by_name and if one is there return it,
      #  otherwise run create_by_name
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    # "Taylor Swift - Blank Space.mp3") 
    # Separate the artist name from the rest of the data based on the - delimiter.
    # Don't forget you have to remove the '.mp3' part of the string.
    #clean up the filename into song and artist
    split_filename = filename.split(" - ")
    artist = split_filename[0]
    name = split_filename[1].split(".")[0]
    #call new
    song = self.new_by_name(name)
    #add artist
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    #call new_from...
    song = self.new_from_filename(filename)
    #save
    song.save
    #return
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
