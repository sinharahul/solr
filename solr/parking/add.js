// Load dependency
var solr = require('solr-client');

// Create a client
var client = solr.createClient('localhost',8983,'parking');

// Add a new document
client.add(
{ "id" : "3" , "p_lot_name" : "DayCare" , "p_lot_id" : "Lot1" , "p_lot_customer_name" : "Sweety" , "p_lot_date_start" : "NOW" , "p_lot_date_end" : "NOW+1MONTHS" , "p_lot_amount" : "120" , "p_lot_amount_paid" : "true" }
,function(err,obj){
   if(err){
      console.log(err);
   }else{
      console.log('Solr response:', obj);
   }
});
