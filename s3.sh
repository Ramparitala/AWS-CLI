#Ref of s3api  https://docs.aws.amazon.com/cli/latest/reference/s3api/

# Create s3 bucket
aws s3 mb s3://jupiter-bkt

#Copy an object into s3 bucket from local machine.
aws s3 cp handler.py s3://jupiter-bkt

#List bicket objects
aws s3 ls s3://jupiter-bkt

#Put an object in bucket 
aws s3api put-object --bucket jupiter-bkt --key serverless.yml --body serverless.yml

#Delete an object from s3 bucket
aws s3api delete-object --bucket jupiter-bkt --key Volumes.sh

#Sync s3 bucket and local workspace and vice versa 
aws s3 sync "/Users/paritalaveera/Downloads/Aws Keys/AWS-CLI" s3://jupiter-bkt/

aws s3 sync "s3://jupiter-bkt/" "/Users/paritalaveera/Downloads/Aws Keys/AWS-CLI"


aws s3 sync "./tobesynced/" "s3://jupiter-bkt/" --exclude "ignore/*" --exclude "*.cpp"