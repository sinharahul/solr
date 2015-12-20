require 'rubygems'
require 'rsolr'

# Direct connection
solr = RSolr.connect(:read_timeout => 120, :open_timeout => 120)
# send a request to /select
response = solr.get 'techproducts/select', :params => {:q => '*:*'}

puts response

