class Directory
  def self.files(path)
    Dir.glob("#{path}/*.mp3").select do |file|
      file.sub!(path + '/', '')
    end
  end

  def self.contain?(file_location)
    files(file_location).empty?
  end
end
