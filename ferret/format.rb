File.open("index.rb").readlines.each do |line|
   if line =~ /(\d)+/
     line = line.sub(/(\d)+/,"")
     puts line
   end
end
