require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
  	song = self.new
  	song.save
  	return song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	return song
  end

  def self.create_by_name(name)
  	song = self.new
  	song.name = name
  	song.save
  	return song
  end

  def self.find_by_name(name)
  	@@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if !self.find_by_name(name)
  		self.create_by_name(name)
  	else
  		self.find_by_name(name)
  	end
  end

  def self.new_from_filename(filename)
  	song = self.new
  	fn_lst = filename.split(' - ')
  	song.artist_name = fn_lst[0]
  	song.name = fn_lst[1].chomp(".mp3")
  	return song
  end

  def self.create_from_filename(filename)
  	song = self.new
  	fn_lst = filename.split(' - ')
  	song.artist_name = fn_lst[0]
  	song.name = fn_lst[1].chomp(".mp3")
  	song.save
  end

  def self.alphabetical
  	alph_lst = []
  	songs_lst = @@all.map {|song| song.name}
  	songs_lst.sort.each {|title|
  		alph_lst.push(@@all.find {|song| song.name == title})
  	}
  	return alph_lst
  end

  def self.destroy_all
  	@@all.clear
  end

  def save
    self.class.all << self
  end

end
