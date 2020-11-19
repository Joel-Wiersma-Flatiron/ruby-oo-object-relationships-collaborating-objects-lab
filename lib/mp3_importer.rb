class MP3Importer
    attr_accessor :filepath
    def initialize(filepath)
        self.filepath = filepath
    end

    def path
        self.filepath
    end

    def files
        Dir.entries(path).select {|mp3| /[\w\-\.' ]+mp3/.match(mp3)}
    end

    def import
        count = 0
        while count < files.length
            Song.new_by_filename(files[count])
            count += 1
        end
    end

end