avn service create kafka-dirk2             
  --service-type kafka                    
  --cloud google-europe-west1             
  --plan business-4                       
  -c kafka_connect=true                   
  --disk-space-gib 6
  
avn service create influxdb-dirk2             
  --service-type influxdb                    
  --cloud google-europe-west1             
  --plan business-4                                        
  --disk-space-gib 6  
  
avn service create grafana-dirk2             
  --service-type grafana                    
  --cloud google-europe-west1             
  --plan business-4                                       
  --disk-space-gib 6   
  
  
avn service integration-create         
  --integration-type metrics           
  --source-service kafka-dirk2                
  --dest-service influxdb-dirk2               

  
avn service integration-create            
  --integration-type dashboard           
  --source-service influxdb-dirk2                
  --dest-service grafana-dirk2
