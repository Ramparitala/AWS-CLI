#AWS Auto scaling

aws autoscaling create-launch-configuration --launch-configuration-name mylc-cli --image-id ami-0ffa9e8ce19a425f3 --key-name Terraform --security-groups sg-03ad9d758d6c65a2b --instance-type t2.micro --associate-public-ip-address


aws autoscaling create-auto-scaling-group --auto-scaling-group-name lamp-asg-cli --launch-configuration-name mylc-cli --min-size 1 --max-size 3 --vpc-zone-identifier "subnet-00005d03caf4b4e31,subnet-000c4bb6fad8dd8d4"




      Launch configuration --> Autoscaling group 
      Loadbalencer 
      Attach Loadbalencer to autoscaling group


