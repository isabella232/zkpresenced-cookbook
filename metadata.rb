maintainer       "Mike Heffner"
maintainer_email "mike@librato.com"
license          "All rights reserved"
description      "Installs/Configures zkpresenced"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "git"

recipe "zkpresenced", "Setup zk-presenced"
