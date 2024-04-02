gcloud pubsub topics create cloud-pubsub-topic
gcloud pubsub subscriptions create cloud-pubsub-subscription \
--topic cloud-pubsub-topic
gcloud scheduler jobs create pubsub cron-scheduler-job \
--schedule="* * * * *" \
--topic=cron-job-pubsub-topic \
--message-body="Hello World!" \
--location=$REGION
gcloud pubsub subscriptions pull cron-job-pubsub-subscription --limit 5
