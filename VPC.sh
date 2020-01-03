# Create VPC
aws ec2 create-vpc --cidr-block 192.168.0.0/16
# VPC-ID vpc-08d37b904dbbe0c52

# Create Subnet
aws ec2 create-subnet --cidr-block 192.168.1.0/24 --vpc-id vpc-08d37b904dbbe0c52
#Subent-id subnet-00005d03caf4b4e31

aws ec2 create-subnet --cidr-block 192.168.2.0/24 --vpc-id vpc-08d37b904dbbe0c52
#Subent-id subnet-000c4bb6fad8dd8d4

#Search VPC
aws ec2 describe-vpcs --vpc-ids vpc-08d37b904dbbe0c52


#Create Internet-Gateway
aws ec2 create-internet-gateway 
#igw-id igw-091e19b6967bfd249

#Attachigw to VPC
aws ec2 attach-internet-gateway --internet-gateway-id igw-091e19b6967bfd249 --vpc-id vpc-0069525e8899af7ee

#Get default route tables
aws ec2 describe-route-tables --filters "Name=vpc-id, Values=vpc-08d37b904dbbe0c52"
#default rtb-id rtb-0ebcf4d9fae16ae50

#Create route b/w default rt & igw.
aws ec2 create-route --route-table-id rtb-0ebcf4d9fae16ae50 --destination-cidr-block "0.0.0.0/0" --gateway-id igw-091e19b6967bfd249

#Create routetable
aws ec2 create-route-table --vpc-id vpc-08d37b904dbbe0c52
#route-table id for private rtb-0137ed055e2f3b646

#Cretae 2 more subnets 
aws ec2 create-subnet --cidr-block 192.168.2.0/24 --vpc-id vpc-08d37b904dbbe0c52
#Subnet-id subnet-09989cbd6d74c4031
aws ec2 create-subnet --cidr-block 192.168.3.0/24 --vpc-id vpc-08d37b904dbbe0c52
#Subnet-id subnet-025f5f94b141d81bc

#aws ec2 describe-subnets --filters "Name=vpc-id, Values=vpc-08d37b904dbbe0c52" |grep -i SubnetId
            "SubnetId": "subnet-000c4bb6fad8dd8d4",
            "SubnetId": "subnet-09989cbd6d74c4031",
            "SubnetId": "subnet-025f5f94b141d81bc",
            "SubnetId": "subnet-00005d03caf4b4e31",

=====
# Subent association to public routetable

aws ec2 associate-route-table --route-table-id rtb-0ebcf4d9fae16ae50 --subnet-id subnet-000c4bb6fad8dd8d4
# AssociationId rtbassoc-08e0d3b59229fab3e

aws ec2 associate-route-table --route-table-id rtb-0ebcf4d9fae16ae50 --subnet-id subnet-00005d03caf4b4e31
#AssociationId rtbassoc-00867b96f2c22e1a1

=====
# Subent association to private routetable
aws ec2 associate-route-table --route-table-id rtb-0137ed055e2f3b646 --subnet-id subnet-09989cbd6d74c4031
#AssociationId rtbassoc-0ed10f72b133ae48b

aws ec2 associate-route-table --route-table-id rtb-0137ed055e2f3b646 --subnet-id subnet-025f5f94b141d81bc
#AssociationId rtbassoc-02073cb123a6b3f6f


#Create Security group 
aws ec2 create-security-group --group-name testawscli --description "Testing from CLI" --vpc-id vpc-08d37b904dbbe0c52
#GroupId sg-03ad9d758d6c65a2b

aws ec2 authorize-security-group-ingress --group-id sg-03ad9d758d6c65a2b --protocol tcp --port 22 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress --group-id sg-03ad9d758d6c65a2b --protocol tcp --port 80 --cidr 0.0.0.0/0

#Create an instance in public subnet
aws ec2 run-instances --image-id ami-04b9e92b5572fa0d1 --count 1 --instance-type t2.micro --key-name Terraform --security-group-ids sg-03ad9d758d6c65a2b --subnet-id subnet-00005d03caf4b4e31 --associate-public-ip-address

# Cretae an instance in private subnet
aws ec2 run-instances --image-id ami-04b9e92b5572fa0d1 --count 1 --instance-type t2.micro --key-name Terraform --security-group-ids sg-03ad9d758d6c65a2b --subnet-id subnet-09989cbd6d74c4031 

#Stop instances 
aws ec2 stop-instances --instance-ids i-04975f33e05a6fbd0
aws ec2 stop-instances --instance-ids i-00120dd59d167358c

aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped | grep -i InstanceId
                    "InstanceId": "i-0f2166125b8c5b2bd",
                    "InstanceId": "i-04975f33e05a6fbd0",
                    "InstanceId": "i-00120dd59d167358c",
                    "InstanceId": "i-0edc44f1fc82e6b63",
                    "InstanceId": "i-038cd54b13b63e607",

# Allocate elastic ip address
aws ec2 allocate-address --domain vpc
#id eipalloc-0fc12cd6b38c81bf8
#Public subnet subnet-00005d03caf4b4e31 

# Create nat gateway 
aws ec2 create-nat-gateway --allocation-id eipalloc-0fc12cd6b38c81bf8 --subnet-id subnet-00005d03caf4b4e31
# NatGatewayId nat-06ac39558ea001c0e

#create route to private subnet to get internet via nat-gateway
aws ec2 create-route --route-table-id rtb-0137ed055e2f3b646 --nat-gateway-id nat-06ac39558ea001c0e --destination-cidr-block 0.0.0.0/0
# Private subnet subnet-09989cbd6d74c4031