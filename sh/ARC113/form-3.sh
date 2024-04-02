gcloud beta pubsub snapshots create pubsub-snapshot \
--subscription=gcloud-pubsub-subscription 
gcloud pubsub lite-reservations create pubsub-lite-reservation \
--location=$REGION \
--throughput-capacity=1
gcloud pubsub lite-topics create cloud-pubsub-topic-lite \
--location=$REGION \
--partitions=1 \
--per-partition-bytes=30Gib \
--throughput-reservation=demo-reservation \
--message-retention-period=365d
gcloud pubsub lite-subscriptions create cloud-pubsub-subscription-lite \
--location=$REGION \
--topic=cloud-pubsub-topic-lite
