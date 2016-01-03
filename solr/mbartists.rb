require 'rubygems'
require 'rsolr'

# Direct connection
solr = RSolr.connect(:read_timeout => 120, :open_timeout => 120)
response = solr.get 'mbartists/select', :params => {:q => '*:*'}
puts response

