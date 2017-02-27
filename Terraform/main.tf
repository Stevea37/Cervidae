module "network" {
  source      = "./network"
  region      = "${var.region}"
  profile     = "${var.profile}"
  vpc_cidr    = "${var.vpc_cidr}"
  subnet_cidr = "${var.subnet_cidr}"
  label       = "${var.network_label}"
}

module "s3" {
  source      = "./s3"
  region      = "${var.region}"
  profile     = "${var.profile}"
  bucket_name = "${var.bucket_name}"
}

module "elasticsearch" {
  source           = "./elasticsearch"
  region           = "${var.region}"
  profile          = "${var.profile}"
  ami_id           = "${var.global_ami_id}"
  instance_type    = "${var.global_instance_type}"
  vpc_id           = "${module.network.vpc_id}"
  subnet_id        = "${module.network.subnet_id}"
  key_pair         = "${var.key_pair}"
  default_sg_id    = "${module.network.default_sg_id}"
  private_key_path = "${var.private_key_path}"
}

module "kibana" {
  source           = "./kibana"
  region           = "${var.region}"
  profile          = "${var.profile}"
  ami_id           = "${var.global_ami_id}"
  instance_type    = "${var.global_instance_type}"
  vpc_id           = "${module.network.vpc_id}"
  subnet_id        = "${module.network.subnet_id}"
  key_pair         = "${var.key_pair}"
  default_sg_id    = "${module.network.default_sg_id}"
  private_key_path = "${var.private_key_path}"
}

module "logstash" {
  source           = "./logstash"
  region           = "${var.region}"
  profile          = "${var.profile}"
  ami_id           = "${var.global_ami_id}"
  instance_type    = "${var.global_instance_type}"
  vpc_id           = "${module.network.vpc_id}"
  subnet_id        = "${module.network.subnet_id}"
  key_pair         = "${var.key_pair}"
  default_sg_id    = "${module.network.default_sg_id}"
  private_key_path = "${var.private_key_path}"
}