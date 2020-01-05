# Installation on RHEL 8

# Install EPEL rpm. 

sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

sudo yum install npm -y
sudo npm install -g serverless
sudo sls create --help

# Cretae project directory.
sudo mkdir amazing-api  

# Create a project using boilerplate templetes.
sudo sls create --template aws-python  (Select your own app environment in my case python)

# Modify the service as you required.

sudo vi handler.py  (here in my case modified message)

sudo vi serverless.yml (Modified service,stage&region."We have many options are available to modify") 


# Deploy and invoke function 

# Deploy  function 
sudo sls deploy

# Invoke remote function 
sudo sls invoke -function hello

# Invoke function locally 
sudo sls invoke local -function hello 
#END
