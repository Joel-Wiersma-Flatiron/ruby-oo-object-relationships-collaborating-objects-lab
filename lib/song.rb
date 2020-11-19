class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = new(/- ([\w\' ]+) -/.match(filename)[1])
        artist = Artist.new(/([\w ]+) -/.match(filename)[1])
        song.artist = artist
        return song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end