# ARC117
## Run in cloudshell
```cmd
export REGION=
```
```cmd
gcloud services enable dataplex.googleapis.com
gcloud services enable datacatalog.googleapis.com
gcloud dataplex lakes create customer-engagements \
--location=$REGION \
--display-name="Customer Engagements Lake" \
--description="Made By CloudHustlers" 
gcloud dataplex zones create raw-event-data \
--resource-location-type=SINGLE_REGION \
--location=$REGION \
--type=RAW \
--lake=customer-engagements \
--display-name="Raw Event Data Zone" \
--description="Made By CloudHustlers"
gsutil mb -l $REGION gs://$DEVSHELL_PROJECT_ID
gcloud dataplex assets create raw-event-files \
--location=$REGION \
--lake=customer-engagements \
--zone=raw-event-data \
--resource-type=STORAGE_BUCKET \
--resource-name=projects/$DEVSHELL_PROJECT_ID/buckets/$DEVSHELL_PROJECT_ID
```
### Search `Tag templates dataplex`
> open `Create tag template` in new tab > name `Protected Raw Data Template` > Location `check in lab` <br>
>Add Field >Name `Protected Raw Data Flag` > Type `Enumerated` <br>
> Value 1 `Y` > ADD VALUE > VALUE 2 `N` > Done > Create
### From left side click `Search`
> SEARCH `Raw Event Data Zone` > Attach Tags <br>
> Choose the tag templates `Protected Raw Data Template` <br>
> In `Protected Data Flag` > Select `Y` > Save
