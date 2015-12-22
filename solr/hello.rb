require 'rubygems'
require 'rsolr'

# Direct connection
solr = RSolr.connect(:read_timeout => 120, :open_timeout => 120)
# send a request to /select
response = solr.get 'techproducts/select', :params => {:q => '*:*'}

hd= solr.get 'techproducts/select', :params => {:q => 'cat:"hard drive"'}

pop = solr.get 'techproducts/select', :params => {:q => 'inStock:true AND  popularity:[6 TO *]'}

puts response

puts hd
puts pop
