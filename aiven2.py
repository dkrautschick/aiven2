import psycopg
from kafka import KafkaConsumer

from kafka import KafkaConsumer
import json

consumer = KafkaConsumer(
 bootstrap_servers='kafka-dirk-dirk-aiven.a.aivencloud.com:13138',
 security_protocol="SSL",
 ssl_cafile="./ca.pem",
 ssl_certfile="./service.cert",
 ssl_keyfile="./service.key",
 value_deserializer = lambda v: json.loads(v.decode('ascii')),
 auto_offset_reset='earliest'
)

consumer.subscribe(topics='dirk')
for message in consumer:
  print ("%d:%d: v=%s" % (message.partition,
                          message.offset,
                          message.value))
