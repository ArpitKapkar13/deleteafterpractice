# create & attach an Internet Gateway to the VPC
resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "cbz-igw"
  }
}

# create a public route table for the VPC
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "cbz-public-rt"
  }
}

# create route that sends 0.0.0.0/0 to IGW
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  # no depends_on required — implicit dependency via ids
}

# associate the public route table with the provided subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}
