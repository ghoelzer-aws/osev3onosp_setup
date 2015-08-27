#Commands to do basic environment setup as a prequisite to a OSE install
#
#Setup required repos
subscription-manager repos --disable="*"
subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-optional-rpms" \
    --enable="rhel-7-server-ose-3.0-rpms"
#Disable Netork Manager
yum remove -y NetworkManager
#Add additional packages & utilities
yum install -y wget git net-tools bind-utils iptables-services bridge-utils deltarpm
#Install packages needed for quick install utility
yum install -y gcc python-virtualenv
#Update all base packages to latest
yum update -y
#Install Docker
yum install -y docker
#Update docker /etc/sysconfig/docker to use insecure reqistry (only for demo purposes, etc)
sed -i.bak -e 's/^OPTIONS/#OPTIONS/' -e '/^#OPTIONS/a OPTIONS=--insecure-registry 172.30.0.0/16' /etc/sysconfig/docker
#
echo ********************************
echo *
echo * Basic OSE host setup complete, finalize docker storage and docker service setup before running quickstart
echo *
echo ********************************

