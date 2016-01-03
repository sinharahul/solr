 0 #!/usr/bin/env ruby
  1 require 'rubygems'
  2 require 'ferret'
  3 require 'fileutils'
  4 include Ferret
  5 include Ferret::Index
  6 
  7 def usage(message = nil)
  8   puts message if message
  9   puts "ruby #{File.basename(__FILE__)} <data dir> <index dir>"
 10   exit(1)
 11 end
 12 
 13 usage() if ARGV.size != 2
 14 usage("Directory '#{ARGV[0]}' doesn't exist.") unless File.directory?(ARGV[0])
 15 $data_dir, $index_dir = ARGV
 16 begin
 17   FileUtils.mkdir_p($index_dir)
 18 rescue
 19   usage("Can't create index directory '#$index_dir'.")
 20 end
 21 
 22 index = Index.new(:path => $index_dir,          
 23                   :create => true)
 24 
 25 Dir["#$data_dir/**/*.txt"].each do |file_name|  
 26   index << {:file_name => file_name, :content => File.read(file_name)} 
 27 end
 
 28 index.optimize()                                
  29 index.close()