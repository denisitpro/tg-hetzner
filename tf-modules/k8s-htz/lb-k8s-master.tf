resource "hcloud_load_balancer" "k8s_master_lb" {
  name               = "k8s-master-lb"
  load_balancer_type = "lb11"
  location           = "fsn1"
  #  algorithm          = "round_robin"
  labels = {
    "env" : "dev"
  }
}

resource "hcloud_load_balancer_target" "k8s_master_lb_target" {
  count            = length(hcloud_server.k8s_master)
  type             = "server"
  load_balancer_id = hcloud_load_balancer.k8s_master_lb.id
  server_id        = hcloud_server.k8s_master[count.index].id
}


resource "hcloud_load_balancer_service" "k8s_master_lb_service_6443" {
  load_balancer_id = hcloud_load_balancer.k8s_master_lb.id
  protocol         = "tcp"
  listen_port      = "6443"
  destination_port = "6443"
  health_check {
    protocol = "tcp"
    port     = 6443
    interval = 5
    timeout  = 1
    retries  = 5
  }
}
