
default[:zkpresenced][:dir] = "/opt/src/zkpresenced"
default[:zkpresenced][:repo] = "https://github.com/librato/zk-recipes"
default[:zkpresenced][:branch] = "master"

default[:zkpresenced][:logfile] = "/var/log/zk-presenced.log"

default[:zkpresenced][:hosts] = []
default[:zkpresenced][:types] = []
default[:zkpresenced][:namespace] = "presence"

default[:zkpresenced][:bundle_cmd] = "bundle"
