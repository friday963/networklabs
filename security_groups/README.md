## Security Group Lab

This lab accompanies an article published to dev.to.  If you have not already read it, I encourage you to go [HERE](https://dev.to/friday963/aws-security-groups-for-network-engineers-ja7) where I give a brief overview of security groups and how network engineers can conceptualize and better understand how they compare to ACL's that are traditionally found on switches and routers.  This quick demo is to illustrate a few of the topics mentioned in that article to further reinforce their functionality.

In this lab you'll be creating two ec2 instances and an RDS database.  Both the instances are running an nginx web server, serving traffic on port 80.  Both EC2 have a security group that allows inbound traffic on port 80 and a wide open outbound policy (meaning the server can INITIATE communications to another client and not just receive incoming traffic). Web server 2 also has an outbound policy that will explicitly allow it to talk to the RDS instance. The RDS instance also has a security group on it but this security group only allows communications from one of the security groups associated with one particular web server.

A video will accompany this lab in the near future as a walkthrough.
