## TERRAFORM

### commands

1. terrafrom init
    1. to be used when initialising the terraform
    2. also, when anything changed in terraform block
2. terraform validate
3. terraform plan
4. terraform apply 
    also triggers refresh command
5. terraform destroy
6. terraform fmt
7. terraform destroy --target=<running resource , item from state list>
    1. `terraform destroy --target=<running resource , item from state list>`
8. terraform refresh
9. terraform state list
    -> outputs list of resources 
10. terraform state show <running resource, item from the list>
11. terraform state rm
    1. example
        1. `terraform state rm aws_key_pair.<my_key>`
12. terraform import 
    1. will require apply to fetch the state
    2. example
        1. `terraform import aws_instance.<my_instance> <instance_id>` # importing a resouce created manually to automate using terraform
        2.  `terraform import aws_key_pair.<my_key> <key_id/key_name>` 
13. terraform workspace list
    1. default is 'default'
14. terraform workspace new <workspace_name>
15. terraform workspace select <workspace_name>
    1. to switch between workspace 
    2. and to associate workspace with git branches
    3. you have to manually switch workspace when switching branches



### interpolation
-> getting the value of a terraform resource block created

### meta arguments 
1. count    
2. for_each()
3. depends_on

### functions
1. file(), 
2. tomap()
    1. to use map key and values to add dynamic attributed to instance
        each.key -> for instance tag name
        each.val -> for instance type name
    2. for out put use for loop to iterate and print insance properties
3. merge()
### conditional expression/statement
1. ternary operator
      expression ? : 

### outputs : 
resource : https://www.youtube.com/watch?v=VCAhujFE_7w&list=PL0tP8lerTbX3jYgiu3PEJAMuaIr64ZSpk&index=13
to get a values of aws service applied after apply command


### random provider
resource : https://www.youtube.com/watch?v=727ijIVKbKM&list=PL0tP8lerTbX3jYgiu3PEJAMuaIr64ZSpk&index=15
to get a random values, keys, identifier


### terraform remote state management : backend ( in terraform block)
backend managed in s3 bucket created seperately 

1. Problem
    1. state management : cannot commit state to github
    2. state conflict : cannot keep up to date with state cz it's not commited to git to be able to pull
2. Solution
    1. that's why put on Remote Backend
3. Remote Backend 
    1. storage space for state file commonly accessible for team
    2. also, statefile locking to be applied 
    3. by using dynomoDB(table, schemaless, Nosql datablase) with lock and release mechanism
    4. for the time lockId in enabled/active no other can access the state file from s3 bucket
4. workspaces
    1. isolating terraform workspaces and creating new for diff git branch per environment


### Terraform Modules


## AWS 

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



### Variables

1. Environment variables
`export TF_VAR_aws_instance_type=t2.mincro`

2. terraform.tfvars
3. *.auto.tfvars
4. -var , -var-file