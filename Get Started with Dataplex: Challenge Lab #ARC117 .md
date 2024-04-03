# ARC117
### nEED TO WORK
## Run in cloudshell
```cmd
gcloud dataplex lakes create Customer-Engagements \
    --region=$REGION \
    --display-name="Customer Engagements Lake" \
    --description="Lake for storing and analyzing customer engagement data" 
gcloud dataplex zones create Raw-Event-Data \
    --region=$REGION \
    --type=RAW \
    --lake=Customer-Engagements \
    --display-name="Raw Event Data Zone" \
    --description="Zone for unprocessed customer event data"
gsutil mb -l $REGION gs://$DEVSHELL_PROJECT_ID
gcloud dataplex assets create Raw-Event-Files \
    --location=$REGION \ 
    --lake=Customer-Engagements \
    --zone=Raw-Event-Data \
    --type=STORAGE_BUCKET \
    --storage-bucket=$DEVSHELL_PROJECT_ID
gcloud dataplex tag-templates create Protected-Raw-Data-Template \
    --location=$REGION \
    --display-name="Protected Raw Data Template" \
    --field=protected_raw_data_flag,type=ENUM,enum_values=Y,enum_values=N
gcloud dataplex zones add-iam-policy-binding Raw-Event-Data \
    --location=$REGION \
    --lake=Customer-Engagements \
    --member=user:$USER_EMAIL \
    --role=roles/dataplex.viewer
```
