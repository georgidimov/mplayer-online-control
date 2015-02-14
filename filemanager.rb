source_folder = '/home/georgi/Music/last added'
directory = Dir.open(source_folder)
puts Dir.glob("#{source_folder}/*.mp3")
