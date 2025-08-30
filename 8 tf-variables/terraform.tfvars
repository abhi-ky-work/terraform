aws_instance_type = "t2.micro"
ec2_root_block_config = {
    vol_size = 30
    vol_type = "gp3"
}
additional_tags={
    DEP = "QA"
    PROJECT = "tikitu"
}

