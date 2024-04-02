cat > city_temp_schema.avsc << EOF
{                                             
            "type" : "record",                               
            "name" : "Avro",                                 
            "fields" : [                                     
            {                                                
                "name" : "city",                             
                "type" : "string"                            
            },                                               
            {                                                
                "name" : "temperature",                      
                "type" : "double"                            
            },                                               
            {                                                
                "name" : "pressure",                         
                "type" : "int"                               
            },                                               
            {                                                
                "name" : "time_position",                    
                "type" : "string"                            
            }                                                
        ]                                                    
    }
EOF
gcloud pubsub schemas create city-temp-schema \
--type=AVRO \
--definition-file=city_temp_schema.avsc
gcloud pubsub topics create temp-topic \
--schema=temperature-schema \
--message-encoding=JSON 
git clone https://github.com/CodingWithHardik/ARC113.git
cd ARC113/helloPubSub
sudo chmod +x run.sh
./run.sh
