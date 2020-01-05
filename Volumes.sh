
# EBS&EFS
aws ec2 create-volume --availability-zone us-east-1 --size 1 --type gp2


sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-36b0b2b7.efs.us-east-1.amazonaws.com:/ /deliverables


