#REF  https://docs.aws.amazon.com/cli/latest/reference/docdb/create-db-subnet-group.html

#Create DB subnetgroup with private subnets
aws rds create-db-subnet-group \
    --db-subnet-group-description "a sample subnet group from cli" \
    --db-subnet-group-name my-subnet-group-from-cli \
    --subnet-ids "subnet-0c2a56846f8abde1a" "subnet-0f0a3f7675ca0287a"
 # "DBSubnetGroupArn": "arn:aws:rds:us-east-1:850457132431:subgrp:my-subnet-group-from-cli"
=====
#Ref https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-security-group.html

#Create Securitygroup with open 3306 port with in VPC
aws rds create-db-security-group --db-security-group-name AllowSSH --db-security-group-description "My Test Security Group"
# "DBSecurityGroupArn": "arn:aws:rds:us-east-1:850457132431:secgrp:allowssh"
=====

#Create DB in subnetgroup with (db.t2.micro)

aws rds create-db-instance --db-name mysqlcli\
    --allocated-storage 10 --db-instance-class db.t2.micro \
    --db-instance-identifier test-instance \
    --engine mysql \
    --master-username admin \
    --master-user-password rootroot



#Create readreplica in diffrent region.




