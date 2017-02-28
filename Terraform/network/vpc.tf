##################################################################################################################
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_VPC Resource provisions and configures a VPC, which defines the address      #
# space and network configurations of your AWS environment.                                                      #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/vpc.html                                        #
#                                                                                                                #
# The Amazon Web Services (AWS) AWS_INTERNET_GATEWAY Resource provisions and configures an internet gateway,     #
# which provides the gateway for external traffic to pass in and out of your VPC.                                #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/internet_gateway.html                           #
#                                                                                                                #
# Output variables are used upstream in the root project, and passed into the EC2 component modules.             #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/outputs.html                                      #
#                                                                                                                #
##################################################################################################################

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.label}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"
  tags {
    Name = "${var.label}"
  }
}
output "vpc_id" {
  value = "${aws_vpc.default.id}"
}