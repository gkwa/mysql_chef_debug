apt -qqy install net-tools </dev/null
export DEBIAN_FRONTEND=noninteractive
echo '{"mysql": { "version": "5.7" }}' | chef-client -j /dev/stdin --local-mode --override-runlist 'recipe[mysql_test::smoke]' --recipe-url https://s3-us-west-2.amazonaws.com/taylors-bucket/chef-cookbooks-mysql.tgz
netstat -tlnu | grep 127.0.0.1:3306 | grep LISTEN
