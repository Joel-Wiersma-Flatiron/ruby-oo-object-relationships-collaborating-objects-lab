class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found_artist = all.find { |artist| artist.name == name}
        found_artist == nil ? new(name) : found_artist 
    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self
                puts song.name
            end
        end
    end
end