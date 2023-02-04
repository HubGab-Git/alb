resource "aws_instance" "test" {
  count                   = 2
  ami                         = "ami-0fe0b2cf0e1f25c8a"
  instance_type               = "t3.nano"
  tags = {
    Name = "Server ${count.index}"
  }
}