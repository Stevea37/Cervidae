class cervidae::profiles::firewall::elasticsearch
  {
    notice("Running elasticsearch firewall configurations for $server_type.")

    firewall { '201 Allow inbound 9200':
      dport   => 9200,
      proto   => tcp,
      action  => accept,
    }
  }
