resource "aws_subnet" "public" {
    count               = length(var.PUBLIC_SUBNET_CIDR)
    vpc_id              = aws_vpc.main.id
    cidr_block          = element(var.PUBLIC_SUBNET_CIDR, count.index)
    availability_zone   = element(var.AZ, count.index)

    tags =  {
        Name = "${var.env}-pub-${element(var.AZ, count.index)}"
    }
}


############# for private subnet creation #############

resource "aws_subnet" "private"{
    count               = length(var.PRIVATE_SUBNET_CIDR)
    vpc_id              = aws_vpc.main.id
    cidr_block          = element(var.PRIVATE_SUBNET_CIDR, count.index)
    availability_zone   = element(var.AZ, count.index)

    tags =  {
        Name = "${var.env}-prv-${element(var.AZ, count.index)}"
    }
}