// Creates a peering between VPCs different accounts and different regions
module "multi_account_multi_region" {
  source = "../../"

  providers = {
    aws.this = aws.this
    aws.peer = aws.peer
  }

  this_vpc_id = var.this_vpc_id
  peer_vpc_id = var.peer_vpc_id

  auto_accept_peering = true
  peer_dns_resolution = true
  this_dns_resolution = true

  tags = {
    Name        = "vpc-peering-MGMT-10.10.x.x-to-BCP-10.20.X.X"
    Environment = "Management"
  }
}
