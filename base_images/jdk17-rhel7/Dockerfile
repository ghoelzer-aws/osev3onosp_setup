FROM rhel7.0
MAINTAINER Greg Hoelzer ghoelzer@redhat.com

# Install packages necessary to run EAP
RUN yum --disablerepo rhel-sap-hana-for-rhel-7-server-rpms -y install git saxon unzip java-1.7.0-openjdk-devel.x86_64 && yum clean all

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss

# Set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0

