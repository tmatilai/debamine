chef_dir        = "#{ENV['HOME']}/.chef"

log_level       :info
log_location    STDOUT

cache_type      "BasicFile"
cache_options   :path => "#{chef_dir}/checksums"

# knife-solo
knife[:solo]                  = true
knife[:solo_path]             = "./chef-solo"

knife[:chef_node_name]        = "debamine"

# EC2
knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_KEY']
knife[:aws_ssh_key_id]        = ENV['USER']
knife[:region]                = "us-east-1"
knife[:flavor]                = "m1.medium"
knife[:image]                 = "ami-7ce17315"  # Debian 6.0.7 (Squeeze)
