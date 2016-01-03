#!/usr/bin/env rails runner

# the above shebang loads up the Rails environment giving us access to ActiveRecord.

puts "Populating MyFaves relational database from data in MusicBrainz Solr..."
rsolr = RSolr.connect :url => 'http://192.168.1.2:8983/solr'
response = rsolr.get 'mbartists/select', :params => {:q => '*:*', :start => 0, :rows => 399000}
puts response['response']['docs'].length 

 
  #break if response['response']['docs'].empty?  # at the end of the dataset available
  
  response['response']['docs'].each do |doc|
    id = doc["id"]
    id = id[7..(id.length)]
    a = Artist.new(
      :id => id,
      :name => doc["a_name"], 
      :group_type => doc["a_type"], 
      :release_date => doc["a_release_date_latest"]
    )
    begin
      a.save!
    rescue ActiveRecord::StatementInvalid => ar_si
      raise ar_si unless ar_si.to_s.include?("PRIMARY KEY must be unique") # sink duplicates
    end  
  end
  
  
  
