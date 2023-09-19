# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN EC2 INSTANCE RUNNING UBUNTU
# See test/terraform_aws_example.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "example" {
  ami           = "${data.aws_ami.centos-stream8.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.instance_name}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LOOK UP THE LATEST UBUNTU AMI
# ---------------------------------------------------------------------------------------------------------------------

data "aws_ami" "centos-stream8" {
  most_recent = true
  owners      = ["701759196663"] # Canonical

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["spel-minimal-centos-8stream-hvm-*"]
  }
}