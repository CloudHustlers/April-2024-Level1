# ARC113
## Run in cloudshell
```cmd
export FORM_ID=
```
```cmd
export REGION=
```
```cmd
curl -L -o run.sh https://raw.githubusercontent.com/CloudHustlers/files-2024/main/ARC113/$FORM_ID.sh
sudo chmod +x run.sh
./run.sh
```
### If Form Id is `form-2` then run the down command
```cmd
gcloud functions deploy gcf-pubsub \
--trigger-topic=gcf-topic \
--runtime=nodejs16 \
--entry-point=helloPubSub \
--region=$REGION
```
