terrafrom init
terraform validate
terraform plan
terraform apply
terraform destroy



### outputs : 
resource : https://www.youtube.com/watch?v=VCAhujFE_7w&list=PL0tP8lerTbX3jYgiu3PEJAMuaIr64ZSpk&index=13
to get a values of aws service applied after apply command


### random provider
resource : https://www.youtube.com/watch?v=727ijIVKbKM&list=PL0tP8lerTbX3jYgiu3PEJAMuaIr64ZSpk&index=15
to get a random values, keys, identifier


### terraform remote state management : backend ( in terraform block)
backend managed in s3 bucket created seperately 


### deploy static website on s3 bucket 
will need to edit and grant public access policy and then add policy for public access



### virtual private cloud (VPC)
cidr 
1. subnets
    public
        routetables (public)
            internet gateway
                security groput 
                    ( to control the inbound and outbound )
                    works on instance level
                    allow only
                ACL's Access Control List
                    ( optional lever of security firewall to control inbound and outbound in and out of one or more subnets )
                    works on subnet level
                    allow or deny rule
    private
        routetable (private) 
            private-vpc-gateway
                NAT - Network Adress Transalation
                    enables instances in private subnet to connect to the internet or other aws services, but prevents internet from initiating connections with those instances
 
2. VPC Peering
    a networking connection between to VPC that enables you to route traffic between them privately

3. VPC Endpoints
    allows you to privately connect your vpc to supported aws services and VPC endpoint services powered by AWS PrivateLink

4. Bastion Host
    a special-purpose instance that provides secure access to your instances in private subnet 
    its kind of a jump server, eg, an instance in public subnet(remotely accessible) that connects with your instance in private subnet

5. Elastic Ip Address : 
    static ip addresses designed for you dynamic cloud computing 
    say for some other instances/devices rely on you instance which gets off and on so it will have new ip address, but a static ip is needed

6. VPC Flow Logs
    Capture information about the IP traffic going to and from network interfaces in your VPC.

7. Direct Connect: 
    Establishes a dedicated network connection from your premises to AWS.

8. AWS Client VPN: 
    Managed VPN service that enables secure remote access to AWS resources and on-premises networks using OpenVPN-based clients.


