

yum update -y && yum install -y centos-release-scl && yum install -y rh-ruby25-ruby-devel make gcc && yum clean all
scl enable rh-ruby25 bash 
gem install chef-zero
gem install berkshelf
