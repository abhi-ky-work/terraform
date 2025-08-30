ec2_root_block_config = {
    vol_size = 40
    vol_type = "gp3"
}

# terraform plan -var='ec2_root_block_config = { vol_size = 40, vol_type = "gp3"}'