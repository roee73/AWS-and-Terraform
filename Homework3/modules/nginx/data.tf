# DATA

data "aws_availability_zones" "available" {

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


data "template_file" "sh_nginx" {
  template = file("nginx.sh")
  vars = {
    s3_webserver_log_id = aws_s3_bucket.opsschool_s3_bucket.id
  }
}
