resource "aws_vpc_peering_connection" "peer" {
# peer_owner_id = var.peer_owner_id    ---- this value is not req as it is in same account
  peer_vpc_id   = aws_vpc.main.id
  vpc_id        = var.DEFAULT_VPC_ID


tags = {
    Name = "${var.ENV}-default-robot-peering"
}
}